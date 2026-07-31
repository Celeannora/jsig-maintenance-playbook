#!/usr/bin/env python3
"""
start_here.py

Interactive first-run setup wizard for this repository. Run this once after
cloning to get oriented and configure the parts of the toolchain that are
meant to be filled in locally: who holds each JSIG role, whether the STIG/
CVE/Nessus reference databases have data in them yet, and a one-shot
practice run of the variance-record generator so you can see real output
before you touch a real finding.

WHAT THIS DOES NOT DO
----------------------
This never edits MAINTENANCE-PLAN.md. The 110-task master calendar (task
list, frequencies, Control ID assignments) is a stable, shared reference
and is out of scope for this wizard, permanently.

This never commits anything to git and never fabricates data. Every step
either calls one of the existing generator scripts in this folder (so the
underlying tool's own fail-closed behavior applies) or writes a small,
clearly-labeled local file. Role assignments in particular are written to
a gitignored, local-only file (data/role_assignments.local.json) rather
than any committed file, because a person's name is program-specific data
and this repo's stated scope is unclassified, general-framework reference
material only (see the root README's "Scope note").

USAGE
-----
    python3 execution-plan/tools/start_here.py
    # or, from the repo root:
    python3 start_here.py

Every step can be skipped interactively (press Enter) or up front with a
flag:
    --skip-roles       Don't ask about role assignments
    --skip-stig        Don't offer to (re)build the STIG reference DB
    --skip-cve         Don't offer to pre-fetch any CVE IDs
    --skip-nessus      Don't offer to pre-fetch any Nessus Plugin IDs
    --skip-sample      Don't offer to generate a practice variance record
    --check-only       Only run the environment check and print the
                        summary -- skip every interactive step. Useful for
                        a quick "what state is this checkout in" look, or
                        for scripted/CI use.

Safe to re-run at any time -- every step is idempotent or additive, and
nothing here is a one-way door.
"""

import argparse
import json
import shlex
import subprocess
import sys
import textwrap
import urllib.error
import urllib.request
from datetime import datetime, timezone
from pathlib import Path

TOOLS_DIR = Path(__file__).resolve().parent
REPO_ROOT = TOOLS_DIR.parent.parent
DATA_DIR = TOOLS_DIR / "data"
STIG_INTAKE_DIR = TOOLS_DIR / "stig_intake"
VARIANCE_DIR = TOOLS_DIR.parent / "variance-records"

# 17 JSIG Section 1.5 roles, grouped exactly as in playbooks/roles/INDEX.md.
ROLE_GROUPS = [
    ("Agency / Executive Roles", [
        "Agency/Component Head",
        "Risk Executive (Function) (REF)",
        "Chief Information Officer (CIO)",
        "Chief Information Security Officer (CISO)",
    ]),
    ("Authorization Roles", [
        "Authorizing Official (AO)",
        "Delegated Authorizing Official (DAO)",
        "Security Control Assessor (SCA)",
    ]),
    ("Common-Control & Program-Security Roles", [
        "Common Control Provider (CCP)",
        "Program Security Officer (PSO)",
    ]),
    ("Data & Mission Ownership Roles", [
        "Information Owner/Steward",
        "Mission/Business Owner (MBO)",
    ]),
    ("Technical / Operational Security Roles", [
        "Information System Owner (ISO)",
        "Information System Security Engineer (ISSE)",
        "Information System Security Manager (ISSM)",
        "Information System Security Officer (ISSO)",
    ]),
    ("User Roles", [
        "Privileged Users",
        "General Users",
    ]),
]
TOTAL_ROLE_COUNT = sum(len(roles) for _, roles in ROLE_GROUPS)

_stdin_exhausted = False


def ask(prompt, default=""):
    """input() with EOF/interrupt safety so this degrades gracefully when
    run non-interactively (piped/truncated stdin) instead of crashing."""
    global _stdin_exhausted
    if _stdin_exhausted:
        return default
    try:
        raw = input(prompt).strip()
    except EOFError:
        _stdin_exhausted = True
        print("\n(No more input on stdin -- using defaults for everything remaining.)")
        return default
    except KeyboardInterrupt:
        print("\n\nStopped. Nothing after this point was written.")
        sys.exit(130)
    return raw if raw else default


def yesno(prompt, default=True):
    hint = "Y/n" if default else "y/N"
    raw = ask(f"{prompt} [{hint}]: ")
    if raw == "":
        return default
    return raw.strip().lower() in ("y", "yes")


def print_header(title):
    print("\n" + "=" * 72)
    print(title)
    print("=" * 72)


def run_tool(cmd):
    print(f"\n$ {' '.join(shlex.quote(str(c)) for c in cmd)}")
    result = subprocess.run(cmd, cwd=str(REPO_ROOT))
    return result.returncode == 0


def print_banner():
    print_header("JSIG Maintenance & Sustainment Playbook -- Start Here")
    print(textwrap.dedent(f"""\
        This interactive wizard configures a fresh checkout of this repo. It will:
          1. Check your environment (Python version, network reachability, existing data)
          2. Optionally record who holds each of the {TOTAL_ROLE_COUNT} JSIG roles (local file only)
          3. Help you import official STIG data
          4. Optionally pre-fetch known CVE IDs
          5. Optionally pre-fetch known Nessus Plugin IDs
          6. Generate one practice Variance/Risk-Acceptance record so you can see real output

        MAINTENANCE-PLAN.md's 110-task master calendar is never touched by this script.
        Press Enter to skip any prompt. Ctrl-C exits cleanly at any point.
        Safe to re-run any time -- nothing here is a one-way door.
        """))


def _check_reachable(url):
    """A plain, no-header GET to a bare domain root can get an HTTP-level
    403 from sites that block generic requests (confirmed for NVD) even
    though the actual API/page endpoints this repo's tools call work fine
    with a descriptive User-Agent. So: any HTTP response at all (even an
    error status) means the network path is up; only a connection-level
    failure (DNS, timeout, refused) means genuinely unreachable."""
    req = urllib.request.Request(url, headers={"User-Agent": "jsig-maintenance-playbook-start-here/1.0"})
    try:
        urllib.request.urlopen(req, timeout=4)
        return True
    except urllib.error.HTTPError:
        return True
    except Exception:
        return False


def _report_db(path, label):
    if not path.exists():
        print(f"  {label}: not built yet ({path.relative_to(REPO_ROOT)})")
        return
    try:
        data = json.loads(path.read_text())
        count = len(data.get("findings", {}))
        print(f"  {label}: {count} entries cached ({path.relative_to(REPO_ROOT)})")
    except Exception as exc:
        print(f"  {label}: present but unreadable ({exc})")


def check_environment():
    print_header("Step 1 of 6 -- Environment check")
    py_ok = sys.version_info >= (3, 8)
    print(f"Python: {sys.version.split()[0]} ({'OK' if py_ok else 'older than the recommended 3.8+'})")

    marker = REPO_ROOT / "MAINTENANCE-PLAN.md"
    if marker.exists():
        print(f"Repo root: {REPO_ROOT} (found MAINTENANCE-PLAN.md)")
    else:
        print(f"Repo root: {REPO_ROOT} (WARNING: MAINTENANCE-PLAN.md not found here -- is this the right checkout?)")

    for label, url in (
        ("NVD (CVE lookups)", "https://services.nvd.nist.gov"),
        ("Tenable (Nessus Plugin lookups)", "https://www.tenable.com"),
    ):
        reachable = _check_reachable(url)
        state = "reachable" if reachable else "not reachable right now (fine if you're working offline)"
        print(f"  Network to {label}: {state}")

    _report_db(DATA_DIR / "stig_reference.json", "STIG reference DB")
    _report_db(DATA_DIR / "cve_reference.json", "CVE reference DB")
    _report_db(DATA_DIR / "nessus_reference.json", "Nessus Plugin reference DB")


def assign_roles():
    print_header(f"Step 2 of 6 -- Who holds each of the {TOTAL_ROLE_COUNT} JSIG roles? (optional, local-only)")
    print("Saved to a LOCAL, gitignored file -- a person's name is never committed to this")
    print("shared reference repo (see the root README's Scope note).")
    if not yesno(f"\nWalk through all {TOTAL_ROLE_COUNT} roles now? (You can also do this later.)", False):
        print("Skipped -- re-run this wizard anytime, or edit "
              f"{(DATA_DIR / 'role_assignments.local.json').relative_to(REPO_ROOT)} directly.")
        return {}

    print("\nEnter a name/title for each role, or press Enter to leave it unassigned.\n")
    assignments = {}
    for group_name, roles in ROLE_GROUPS:
        print(f"-- {group_name} --")
        for role in roles:
            value = ask(f"  {role}: ")
            if value:
                assignments[role] = value

    out_path = DATA_DIR / "role_assignments.local.json"
    if assignments:
        payload = {
            "generated_at": datetime.now(timezone.utc).isoformat(),
            "note": "Local, site-specific data. Not committed to the shared repo -- see .gitignore.",
            "assignments": assignments,
        }
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(json.dumps(payload, indent=2) + "\n")
        print(f"\nSaved {len(assignments)}/{TOTAL_ROLE_COUNT} role assignments to "
              f"{out_path.relative_to(REPO_ROOT)} (local-only).")
    else:
        print("\nNo roles assigned yet -- that's fine, re-run this wizard anytime.")

    unassigned = TOTAL_ROLE_COUNT - len(assignments)
    if unassigned:
        print(f"{unassigned} role(s) still unassigned. See PROGRESS.md's Phase 0 row "
              "when you're ready to formalize this in writing.")
    return assignments


def setup_stig():
    print_header("Step 3 of 6 -- STIG reference database")
    db_path = DATA_DIR / "stig_reference.json"
    if db_path.exists():
        try:
            existing = len(json.loads(db_path.read_text()).get("findings", {}))
            print(f"Existing database already has {existing} findings ({db_path.relative_to(REPO_ROOT)}).")
        except Exception:
            pass

    intake_files = []
    if STIG_INTAKE_DIR.exists():
        intake_files = [p for p in STIG_INTAKE_DIR.iterdir() if p.is_file() and p.name != ".gitkeep"]

    if intake_files:
        print(f"\nFound {len(intake_files)} file(s) in {STIG_INTAKE_DIR.relative_to(REPO_ROOT)}:")
        for f in intake_files[:10]:
            print(f"  - {f.name}")
        if len(intake_files) > 10:
            print(f"  ... and {len(intake_files) - 10} more")
        print("\nNote: this rebuilds the database from everything currently in the intake folder --")
        print("if you removed files since the last build, their findings will drop out of the rebuild.")
        if yesno("Rebuild the STIG reference database from these files now?", True):
            run_tool([sys.executable, str(TOOLS_DIR / "stig_reference_builder.py"), "build"])
    else:
        print(f"\nNo files in {STIG_INTAKE_DIR.relative_to(REPO_ROOT)}/ yet.")
        print("This tool can fetch the current quarterly SRG-STIG Library Compilation")
        print("directly (unclassified, no CAC/login needed, currently ~350-400 MB) from:")
        print("  https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_SRG-STIG_Library_<Month>_<Year>.zip")
        if yesno(f"Download it now into {STIG_INTAKE_DIR.relative_to(REPO_ROOT)}/? (~350-400 MB)", False):
            ok = run_tool([sys.executable, str(TOOLS_DIR / "stig_reference_builder.py"), "fetch-compilation"])
            if ok and yesno("Build the STIG reference database from it now?", True):
                run_tool([sys.executable, str(TOOLS_DIR / "stig_reference_builder.py"), "build"])
            elif not ok:
                print("  Download failed -- see the error above. You can retry later with:")
                print("     python3 execution-plan/tools/stig_reference_builder.py fetch-compilation")
        else:
            print("\nTo populate it manually instead:")
            print("  1. From a normal (unclassified, no-CAC-required) connected workstation, download")
            print("     official STIG/SRG .zip packages from https://public.cyber.mil/stigs/downloads/")
            print("     (or the quarterly Library Compilation bundle at")
            print("     https://public.cyber.mil/stigs/compilations/ for everything at once)")
            print(f"  2. Copy them into {STIG_INTAKE_DIR.relative_to(REPO_ROOT)}/ , unmodified -- no need to unzip")
            print("  3. Re-run this wizard (python3 start_here.py), or run:")
            print("     python3 execution-plan/tools/stig_reference_builder.py build")
            print("Skipping for now -- this is expected on a fresh, offline checkout.")


def setup_cve():
    print_header("Step 4 of 6 -- CVE reference database (optional)")
    raw = ask("Comma-separated CVE IDs to fetch now, e.g. CVE-2021-44228 (Enter to skip): ")
    if not raw:
        print("Skipped -- fetch any CVE later with: cve_reference_builder.py fetch --id <ID>")
        print("Want the full NVD catalog instead of targeted lookups? There's an opt-in")
        print("full-mirror mode (~367,000 records, hundreds of MB, written to a separate")
        print("cve_mirror.json so the small curated cache stays git-friendly):")
        print("  python3 execution-plan/tools/cve_reference_builder.py mirror")
        print("  python3 execution-plan/tools/cve_reference_builder.py mirror-update   # refresh later")
        return
    for cve_id in (x.strip() for x in raw.split(",") if x.strip()):
        ok = run_tool([sys.executable, str(TOOLS_DIR / "cve_reference_builder.py"), "fetch", "--id", cve_id])
        if not ok:
            print(f"  Could not fetch {cve_id} -- check the ID and your network connection, or try again later.")


def setup_nessus():
    print_header("Step 5 of 6 -- Nessus Plugin reference database (optional)")
    raw = ask("Comma-separated Nessus Plugin IDs to fetch now, e.g. 156327 (Enter to skip): ")
    if not raw:
        print("Skipped -- fetch any plugin later with: nessus_reference_builder.py fetch --id <ID>")
        print("Note: Tenable does not publish a bulk/mirror feed for its plugin catalog (unlike")
        print("NVD for CVEs), so there is no full-database option here -- only targeted fetches,")
        print("one ID or a batch list at a time, from https://www.tenable.com/plugins/nessus/<id>")
        return
    for plugin_id in (x.strip() for x in raw.split(",") if x.strip()):
        ok = run_tool([sys.executable, str(TOOLS_DIR / "nessus_reference_builder.py"), "fetch", "--id", plugin_id])
        if not ok:
            print(f"  Could not fetch plugin {plugin_id} -- check the ID and your network connection, or try again later.")


def _pick_sample_id():
    """Prefer whatever the user just fetched (CVE, then Nessus), fall back to
    the first STIG entry, so the practice record reflects real work just done
    when possible instead of always defaulting to the same STIG ID."""
    for filename, kind in (
        ("cve_reference.json", "CVE"),
        ("nessus_reference.json", "Nessus Plugin"),
        ("stig_reference.json", "STIG"),
    ):
        path = DATA_DIR / filename
        if not path.exists():
            continue
        try:
            findings = json.loads(path.read_text()).get("findings", {})
        except Exception:
            continue
        if findings:
            return next(iter(findings)), kind
    return None, None


def generate_sample():
    print_header("Step 6 of 6 -- Generate one practice Variance/Risk-Acceptance record")
    candidate_id, candidate_kind = _pick_sample_id()
    if not candidate_id:
        print("No reference data available yet (no STIG/CVE/Nessus entries cached) -- nothing to practice with.")
        print("Come back and re-run this wizard, or generate_variance.py directly, once you've built a database.")
        return

    print(f"Using {candidate_kind} ID {candidate_id} as a practice finding.")
    if not yesno(f"Generate a practice record for {candidate_id} now?", True):
        print("Skipped.")
        return

    asset = ask("  Asset/hostname for this practice record [SAMPLE-ASSET-01]: ", "SAMPLE-ASSET-01")
    scope = ask("  System/enclave scope [Example Enclave]: ", "Example Enclave")
    preparer = ask("  Preparer name and role [(fill in)]: ", "(fill in)")

    cmd = [
        sys.executable, str(TOOLS_DIR / "generate_variance.py"),
        "--id", candidate_id,
        "--asset", asset,
        "--system-scope", scope,
        "--detection-method", "Start-here wizard practice run",
        "--preparer", preparer,
        "--format", "md",
    ]
    ok = run_tool(cmd)
    if ok:
        print(f"\nPractice record written to {VARIANCE_DIR.relative_to(REPO_ROOT)}/ -- open it to see the real,")
        print("official finding text rendered into the template. Delete it once you're done reviewing:")
        print("variance-records/ is meant for real, reviewed findings, not practice output.")


def print_summary(assignments):
    print_header("What to read next")
    print("  - MAINTENANCE-PLAN.md, sections 1 and 1A: the daily-ops checklist")
    print("  - playbooks/roles/INDEX.md: what each of the 17 JSIG roles owns")
    if assignments:
        print("    (roles you just assigned):")
        for role in assignments:
            print(f"      - {role}")
    print("  - execution-plan/README.md: full tooling reference (RACI matrix, runbooks, escalation routing)")
    print("  - execution-plan/runbooks/<Role>.md: your day-to-day task runbook once you know your role")
    print("  - PROGRESS.md: fill in by hand as you actually stand up each phase -- this wizard doesn't edit it")
    print("\nRe-run this wizard anytime: python3 start_here.py")


def main():
    parser = argparse.ArgumentParser(
        description="Interactive first-run setup wizard for this repository.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--skip-roles", action="store_true", help="Don't ask about role assignments")
    parser.add_argument("--skip-stig", action="store_true", help="Don't offer to (re)build the STIG reference DB")
    parser.add_argument("--skip-cve", action="store_true", help="Don't offer to pre-fetch any CVE IDs")
    parser.add_argument("--skip-nessus", action="store_true", help="Don't offer to pre-fetch any Nessus Plugin IDs")
    parser.add_argument("--skip-sample", action="store_true", help="Don't offer to generate a practice variance record")
    parser.add_argument("--check-only", action="store_true",
                         help="Only run the environment check and summary; skip every interactive step")
    args = parser.parse_args()

    print_banner()
    check_environment()

    if args.check_only:
        print_summary({})
        return

    assignments = {} if args.skip_roles else assign_roles()
    if not args.skip_stig:
        setup_stig()
    if not args.skip_cve:
        setup_cve()
    if not args.skip_nessus:
        setup_nessus()
    if not args.skip_sample:
        generate_sample()

    print_summary(assignments)


if __name__ == "__main__":
    main()
