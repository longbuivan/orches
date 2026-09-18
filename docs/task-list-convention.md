# Task List Convention

Use one task list per implementation request. Keep tasks small enough to verify
individually.

## Format

```markdown
# Task: <short title>
F: F-<number> | feature: <feature-id>
SPEC: SPEC-<number>
P: P-<number>
TC: TC-<number>

- [ ] T1 <action> | TC: TC-<number> | acceptance: <observable result> | verify: <command>
- [ ] T2 <action> | TC: TC-<number> | acceptance: <observable result> | verify: <command>
- [ ] T3 <action> | TC: TC-<number> | acceptance: <observable result> | verify: <command>

Verification:
- command: <final command>
- result: passed
```

## Rules

- Task IDs are stable within the request: `T1`, `T2`, `T3`.
- `F` identifies the feature, `SPEC` identifies the stable contract, `P`
  identifies the implementation plan, and `TC` identifies test criteria.
- One task must reference one `TC`; do not mark a task complete without its TC.
- Use `[ ]` pending, `[>]` in progress, `[x]` passed, `[!]` blocked or failed.
- Every task has an observable acceptance condition and a focused check.
- A task is complete only after its check passes; update the checkbox immediately.
- Keep only one task `[>]` at a time.
- Record blockers in the task line; do not hide them in prose.
- The final feature status may become `verified` only after the registry
  verification command passes.
