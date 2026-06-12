# Contributing

Thanks for helping improve LoopLens Codex Skills.

## What to Contribute

Good contributions include:

- clearer boundaries between the three skills
- better output gates
- more generic probe patterns
- examples of drift failure modes, with private details removed
- issue reports showing where a skill overfit or underperformed

Avoid contributions that add project-specific business terms, private paths, customer names, or generated reports.

## Development Rules

- Keep each `SKILL.md` concise.
- Put detailed reusable probes or templates under `references/`.
- Do not add reports, handoffs, runtime logs, screenshots, or project artifacts.
- Use generic terms such as `source fact`, `business object`, `container`, `workflow`, `approval`, and `report`.
- If a rule belongs to only one domain, make it an example in documentation, not a core skill rule.

## Validation

Run before opening a PR:

```bash
./scripts/validate-skills.sh
```

## Issue Triage Labels

Suggested labels:

- `boundary-drift`
- `too-shallow`
- `overfit`
- `missing-output-gate`
- `probe-improvement`
- `docs`

