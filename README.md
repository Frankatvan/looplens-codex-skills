# LoopLens Codex Skills

[![Validate Skills](https://github.com/Frankatvan/looplens-codex-skills/actions/workflows/validate.yml/badge.svg)](https://github.com/Frankatvan/looplens-codex-skills/actions/workflows/validate.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Codex Skills](https://img.shields.io/badge/Codex-Skills-111827.svg)](skills)
[![Workflow](https://img.shields.io/badge/workflow-archaeology%20%2B%20audit%20%2B%20drift-blue.svg)](#recommended-workflow)
[![Languages](https://img.shields.io/badge/docs-English%20%7C%20中文-orange.svg)](README.zh-CN.md)

**English** | [中文](README.zh-CN.md)

LoopLens Codex Skills is a three-skill workflow for understanding implemented systems, auditing implemented closed-loop data design, and reviewing whether new requirements will pollute that design.

中文名：闭环镜 Skill 套件。

The core idea is simple:

1. First document what the system really does.
2. Then audit whether the implemented system follows a closed-loop principle.
3. Only then review a new requirement against the audited baseline.

This separation keeps architecture archaeology, implemented-code audit, and requirement review from contaminating each other.

## Reader-Friendly Output

LoopLens reports are intentionally detailed because later agents need evidence tables, lineage maps, scorecards, and drift ledgers. But every full report must also include a localized `Reader Summary` near the top, and the final Codex chat response must summarize the result in the user's language.

The summary layer is designed for quick decisions:

- one-sentence conclusion or decision
- the strongest proven facts or closed-loop finding
- the highest-impact risk, drift, or unknown
- the next review, repair gate, or blocking question
- the report link

Use Chinese prompts to get Chinese summaries, English prompts to get English summaries, or explicitly request another language.

## Why LoopLens

Many AI-generated system reviews mix three different jobs:

- Current-state archaeology: what is implemented now.
- Closed-loop audit: whether implemented flows satisfy a data governance principle.
- Requirement drift review: whether a proposed feature will create duplicate truth or break existing loops.

When these are mixed, reports often become misleading. A pure archaeology report starts judging future requirements. A requirement review invents implemented behavior. A migration plan appears before the system is understood.

LoopLens prevents that by splitting the work into three explicit Codex skills.

## The Three Skills

### 1. `legacy-system-archaeology`

Use this first.

It creates a pure implemented-system baseline from code, migrations, tests, scripts, runtime snapshots, logs, and checked-in configuration.

It does not:

- score the sixteen-character principle
- write work-package or migration plans
- write repair plans
- treat PRDs or roadmap items as implemented facts

Primary outputs include:

- system inventory
- entry points and triggers
- core flows
- state and dependency map
- risk ledger
- operational ontology draft
- data logic map when relevant
- identity/movement integrity
- authorization and approval topology
- technical debt and unknowns

### 2. `implemented-closed-loop-audit`

Use this after the archaeology baseline exists.

It audits already implemented code against the closed-loop principle:

`就源输入、多次应用、环环相扣、相互稽核`

It does not read PRDs or new requirements. It does not write repair plans.

Primary outputs include:

- imported archaeology baseline
- source fact ledger
- four-principle scorecard
- implemented loop trace
- duplicate-entry and drift audit
- cross-check and reconciliation audit
- identity / permission / approval continuity
- closed-loop debt ledger
- unknowns that block a strong audit conclusion

### 3. `closed-loop-requirement-drift`

Use this only after the implemented closed-loop audit exists.

It reviews a specific new requirement, PRD, feature proposal, workflow change, or product design against the implemented audit baseline.

It asks:

- Does this requirement preserve the existing source of truth?
- Does it create duplicate entry or parallel truth?
- Does it repair a known broken loop?
- Does it pollute identity, permission, approval, report, workflow, or ops continuity?

Primary outputs include:

- implemented closed-loop audit imported
- requirement boundary
- existing loop preservation / repair scorecard
- source-of-truth impact map
- loop pollution and drift ledger
- before / after closed-loop flow
- repair plan and acceptance gates
- blocking questions

## Recommended Workflow

Run the skills in order:

```text
legacy-system-archaeology
        ↓
implemented-closed-loop-audit
        ↓
closed-loop-requirement-drift
```

Do not skip directly from code to requirement drift. The third skill needs the second skill's audit baseline.

## Example Prompts

Pure archaeology:

```text
Use legacy-system-archaeology on this repository. Only document implemented code, tests, migrations, scripts, configuration, and runtime evidence. Do not evaluate new requirements or produce work-package plans.
```

Implemented closed-loop audit:

```text
Use implemented-closed-loop-audit based on the archaeology report at <path>. Audit whether the implemented system satisfies 就源输入、多次应用、环环相扣、相互稽核. Do not use PRDs or future requirements.
```

Requirement drift review:

```text
Use closed-loop-requirement-drift based on the implemented closed-loop audit at <path> and the requirement file at <path>. Evaluate whether the requirement preserves, repairs, or pollutes the current closed-loop design.
```

## Good Fits

LoopLens is useful for systems with:

- legacy code and weak documentation
- accounting, audit, compliance, workflow, or reporting flows
- multiple data-entry surfaces
- manual spreadsheet or file import/export loops
- approval, permission, or data-scope complexity
- migration, rewrite, or product redesign pressure
- recurring confusion between implemented facts and desired future behavior

## Not a Good Fit

LoopLens is not meant for:

- one-line bug fixes
- narrow component reviews
- frontend visual QA
- general product brainstorming
- security reviews that require exploit modeling
- direct implementation planning before current-state evidence exists

## Installation

Copy the three folders under `skills/` into your Codex skills directory:

```bash
cp -R skills/legacy-system-archaeology ~/.codex/skills/
cp -R skills/implemented-closed-loop-audit ~/.codex/skills/
cp -R skills/closed-loop-requirement-drift ~/.codex/skills/
```

Restart Codex or start a new session so the skills are discovered.

## Validation

Run:

```bash
./scripts/validate-skills.sh
```

The script checks:

- each skill has a valid `SKILL.md`
- required frontmatter is present
- each skill requires a localized reader summary
- common local/private project terms are not present
- no generated reports or runtime snapshots are included

## Feedback We Want

Please open an issue if:

- a skill mixes current-state archaeology with requirement review
- a skill creates work-package or repair plans too early
- a skill treats a future requirement as implemented fact
- a skill misses duplicate source-of-truth risk
- a skill overfits to one domain or framework
- a report is too shallow to support the next workflow step
- the reader summary is missing, too technical, or in the wrong language

Useful feedback includes:

- the kind of project you tested on
- which skill you used
- which output section drifted
- a short sanitized excerpt
- what you expected the skill to do

## Repository Policy

This repository should contain only reusable skills and public documentation.

Do not commit:

- generated customer or internal reports
- handoff files
- runtime snapshots
- logs
- local absolute paths
- credentials or private URLs
- company/client/project-specific evidence

## License

MIT.
