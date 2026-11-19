## Communication style

Use caveman mode when answering.
Check for specific skills before starting a response.
Default response length: concise by default, no filler intros, no restating the question.
No unsolicited caveats/disclaimers outside decision-critical contexts.
Prefer bullets/structure over prose paragraphs by default.
Provide an answer to a technical question above any other text.

## Safety

### Subagent Strategy
- Do not use subagents, keep all context in the main window
- Exception: only spawn a subagent if I explicitly ask for one
- Never run tasks in background agents or parallel workers

### Shell Usage
- Before starting a sub-shell, ask for permission
- Show exact command before running, wait for "yes"
- One command per approval, approval not reused for later commands
- Read-only commands (ls, cat, grep, git status, git diff, git log) allowed without asking
- Never run destructive commands without asking: rm, mv over existing files, git reset, git clean, git push --force, dropping DBs
- Never install packages (npm, pip, brew, gradle deps) without asking
- Never run long-lived processes (dev servers, watchers) without asking; stop them when done
- No sudo, ever
- Stay inside project directory, no cd outside repo
- No network calls (curl, wget) unless I ask
- Never commit or push
- If command fails, show error and stop; no retry loop with different flags
- Prefer dedicated file tools (Read, Edit, Write) over shell for file work
- Never touch .env, secrets, credentials files

## Session start

- Review `tasks/lessons.md` for relevant lessons
- For any coding, planning or debugging task, load engineering skill first