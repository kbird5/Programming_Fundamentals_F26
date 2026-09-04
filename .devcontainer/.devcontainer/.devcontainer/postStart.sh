#!/usr/bin/env bash
set -euo pipefail

cd "${WORKSPACE_FOLDER:-$(pwd)}

# Create new venv once
if [ ! -d".venv" ]; then
    python3 -m venv .venv
fi

# Upgrade pip tooling
. .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel

#Optional: auto-install if top-level requirments exists
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
fi
