#!/usr/bin/env bash
# Run after any staff-guide UI change: re-copy docs/html-guide here and push the Pages deploy.
set -euo pipefail
src="$(cd "$(dirname "${BASH_SOURCE[0]}")/../docs/html-guide" && pwd)"
dst="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp -f "$src/onecm-staff-guide.html" "$dst/index.html"
rsync -a --delete "$src/images/" "$dst/images/"

cd "$dst"
git add -A
git commit -m "docs: update staff guide $(date +%F)"
git push
