#!/usr/bin/env python3
"""
Root-level convenience entry point: `python3 start_here.py` from the repo
root runs the interactive setup wizard. The actual implementation lives at
execution-plan/tools/start_here.py, alongside the generator scripts it
drives (stig_reference_builder.py, cve_reference_builder.py,
nessus_reference_builder.py, generate_variance.py) -- this file just makes
it discoverable without having to know that path on a first clone.
"""

import runpy
import sys
from pathlib import Path

_TARGET = Path(__file__).resolve().parent / "execution-plan" / "tools" / "start_here.py"

if __name__ == "__main__":
    if not _TARGET.exists():
        sys.exit(f"error: expected wizard at {_TARGET}, but it's missing. "
                  "Is this a full checkout of the repo?")
    sys.argv[0] = str(_TARGET)
    runpy.run_path(str(_TARGET), run_name="__main__")
