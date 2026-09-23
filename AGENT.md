# Spec-Driven Repository Agent Contract

This repository uses `docs/feature-list.json` as the feature registry,
`docs/task-list-convention-convention.md` for task-record format and lifecycle rules,
`scripts/validate_feature_list.py` as its registry validator, and the
`end-of-turn-sync` skill for final tracking reconciliation.

Before implementation work:

1. Read the feature registry and select the exact feature ID being changed.
2. Set that feature to `in_progress` before editing.
3. Read `docs/task-list-convention-convention.md` before creating or updating a task
   record, and follow its `F/SPEC/P/TC` and checkbox rules exactly.
4. Keep the feature's `spec` stable unless the user explicitly changes it.
5. Prefer small, additive changes that preserve existing source-of-truth and
   security boundaries.
6. Add focused tests or an executable smoke check for new behavior.
7. Mark the feature `implemented` after editing and `verified` only after fresh
   validation output.
8. Run `python3 scripts/validate_feature_list.py` before completion.
9. Run `python3 scripts/verify_feature.py <feature-id>` for the selected feature.

Task-record discipline:

- `docs/task-list-convention-convention.md` is a rules/template document, not a task log.
- Never append implementation-specific tasks, checkboxes, or verification
  results to the convention document.
- Keep implementation tracking in the feature registry and the current task
  context; update the registry verification evidence when work is complete.

Before handing work back to a human, use the `end-of-turn-sync` skill to
reconcile feature status, test criteria, and verification evidence with the
project tracking documents.

Hard constraints:

- Use the registry convention: `F` feature, `SPEC` contract, `P` plan, `TC`
   test criterion, and `STATUS` lifecycle state.
- Do not weaken or silently rewrite a feature's `spec`.
- Preserve source-of-truth boundaries: Markdown is authoritative for notes.
- AI output is a suggestion until explicitly approved by a human.
- Do not expose unpublished notes through public site indexes.
- Do not commit generated databases, model output, or secrets.
- Do not claim success when a required check was blocked; report the blocker.

Change discipline:

- Keep edits narrow and preserve unrelated user changes.
- Add or update tests with behavior changes.
- Prefer existing project scripts and virtual environments.
- Do not reformat unrelated files or revert user changes.

Required verification:

- Every feature entry must contain an executable `verification.command` in
   `docs/feature-list.json`.
- Run `python3 scripts/verify_feature.py <feature-id>` for the selected feature.
- Run `python3 scripts/validate_feature_list.py` before completion.

Do not inspect or modify `.env`, `.ENV`, credentials, tokens, or API keys.
