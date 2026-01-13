#!/usr/bin/env bash
set -euo pipefail

if ! command -v act >/dev/null 2>&1; then
  echo "act not found; please install it first (see README_LOCAL_CI.md)"
  exit 1
fi

echo "Preparing workflows for act..."
./scripts/prepare-act.sh

echo "Running act on build job (workflow: .github/workflows/build-local.yml)..."
act -W .github/workflows/build-local.yml -j build
