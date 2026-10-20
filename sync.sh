#!/usr/bin/env bash
# Publish the staff guide to GitHub Pages.
# This folder IS the source of truth: edit index.html and images/ here, then run this script.
set -euo pipefail
dst="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$dst"
git add -A
git diff --cached --quiet && { echo "guide unchanged"; exit 0; }
git commit -m "docs: update staff guide $(date +%F)"
git push
