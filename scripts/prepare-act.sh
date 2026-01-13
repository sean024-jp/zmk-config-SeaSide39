#!/usr/bin/env bash
set -euo pipefail

mkdir -p .github/workflows
echo "Downloading build-user-config.yml from zmkfirmware/zmk (v0.3)..."
curl -fsSL -o .github/workflows/build-user-config.yml \
  "https://raw.githubusercontent.com/zmkfirmware/zmk/v0.3/.github/workflows/build-user-config.yml"

echo "Creating build-local.yml by rewriting remote 'uses:' to local path..."
sed 's|uses: zmkfirmware/zmk/.github/workflows/build-user-config.yml@v0.3|uses: ./.github/workflows/build-user-config.yml|' \
  .github/workflows/build.yml > .github/workflows/build-local.yml

echo "Prepared .github/workflows/build-user-config.yml and build-local.yml"
