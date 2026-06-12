# Publication Guide

## Recommended Repository Name

`looplens-codex-skills`

## Display Name

LoopLens Codex Skills

中文名：闭环镜 Skill 套件

## Short Description

Three Codex skills for implemented-system archaeology, closed-loop compliance audit, and requirement drift review.

## Longer Description

LoopLens Codex Skills helps engineering and product teams separate three jobs that are often mixed together:

- documenting what an implemented system actually does
- auditing whether the implemented system follows a closed-loop data principle
- reviewing whether a new requirement will pollute or repair that closed loop

It is especially useful for legacy systems, accounting-like systems, workflow systems, data-heavy back-office tools, audit/reporting platforms, and systems with multiple manual or automated data-entry surfaces.

## Recommended GitHub Topics

- codex
- skills
- ai-agents
- legacy-systems
- system-archaeology
- requirements
- data-lineage
- workflow
- audit
- product-engineering

## Recommended First Release

Tag: `v0.1.0`

Release title:

`LoopLens Codex Skills v0.1.0`

Release notes:

```text
Initial public release.

Includes three Codex skills:
- legacy-system-archaeology
- implemented-closed-loop-audit
- closed-loop-requirement-drift

The workflow separates implemented facts, implemented closed-loop audit, and new requirement drift review.
```

## Public Launch Post

```text
I published LoopLens Codex Skills, a three-skill workflow for Codex:

1. Pure implemented-system archaeology
2. Implemented closed-loop audit
3. Requirement drift review

The goal is to stop AI-generated system reviews from mixing current facts, desired requirements, and repair plans too early.

Repo: <repo url>
Feedback welcome, especially examples where the skills drift, overfit, or produce reports that are too shallow.
```

## Iteration Strategy

Treat real user reports as regression tests.

When feedback arrives:

1. Identify which of the three skills drifted.
2. Check whether the issue is a boundary problem, depth problem, overfit problem, or missing output gate.
3. Update the smallest possible skill rule.
4. Run `./scripts/validate-skills.sh`.
5. Add a short changelog entry in the GitHub release notes, not inside the skill folders.

Recommended commit message format:

```text
skill(archaeology): clarify evidence boundary
skill(audit): tighten cross-check scoring
skill(drift): require implemented audit baseline
docs(readme): add usage example
test(validate): block project-specific terms
```

## What Not to Publish

Do not publish:

- real project reports
- internal handoff files
- customer names
- local absolute paths
- runtime snapshots
- credentials or private URLs
- screenshots with private data
- generated analysis from private repositories

