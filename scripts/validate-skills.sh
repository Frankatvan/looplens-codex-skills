#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required=(
  "legacy-system-archaeology"
  "implemented-closed-loop-audit"
  "closed-loop-requirement-drift"
)

for skill in "${required[@]}"; do
  file="$ROOT/skills/$skill/SKILL.md"
  if [[ ! -f "$file" ]]; then
    echo "Missing $file" >&2
    exit 1
  fi
  if ! grep -q '^---$' "$file"; then
    echo "Missing YAML frontmatter in $file" >&2
    exit 1
  fi
  if ! grep -q '^name: ' "$file"; then
    echo "Missing name in $file" >&2
    exit 1
  fi
  if ! grep -q '^description: ' "$file"; then
    echo "Missing description in $file" >&2
    exit 1
  fi
  if ! grep -q 'Reader Summary' "$file"; then
    echo "Missing Reader Summary requirement in $file" >&2
    exit 1
  fi
  if ! grep -qi 'user.*language\|language.*user\|localized' "$file"; then
    echo "Missing localized language requirement in $file" >&2
    exit 1
  fi
done

if find "$ROOT" \( -path '*/reports/*' -o -path '*/handoffs/*' -o -path '*/runtime/*' -o -path '*/snapshots/*' \) -type f | grep -q .; then
  echo "Generated report/handoff/runtime files should not be committed." >&2
  exit 1
fi

private_pattern='(/Users/|AFS|WB公司|Audit Workbench|audit-workbench|Hermes|Mission Control|WeCom|企业微信|Google Sheet|Submission lock|提交锁定|清时捷|太和|Excel Master|wbs-doc|afs-doc|projectCode|pc_code|fatherCode|pcFather|(^|[^[:alnum:]_])WBS([^[:alnum:]_]|$))'

if grep -RInE "$private_pattern" "$ROOT/skills" "$ROOT/README.md" "$ROOT/CONTRIBUTING.md" "$ROOT/PUBLICATION.md" >/tmp/looplens-private-scan.txt; then
  echo "Potential private or overfit terms found:" >&2
  cat /tmp/looplens-private-scan.txt >&2
  exit 1
fi

echo "LoopLens skill validation passed."
