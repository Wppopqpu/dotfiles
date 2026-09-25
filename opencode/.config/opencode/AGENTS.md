# Output Rules

## Language

-   Use **Simplified Chinese** when speaking to user.
-   Use **English** when coding or documenting.
-   Use **Simplified Chinese** when writing TeX documents.
-   **Exception**: User explicitly requests otherwise.

## Code Style

-   Always follow the code style in existing files.
-   Add **necessary** comments and documentation.
-   Match existing naming conventions, indentation, and patterns.

## Evidence-Based Communication

-   If you claim or state something, **provide supporting evidence** unless you are certain.
-   Examples of evidence: test results, documentation, code references.
-   When uncertain, investigate first rather than guessing.

## Planning and Execution

-   Follow the plan produced (if there is one).
-   If the plan needs changes, abort and tell the user what must be changed.
-   Use TodoWrite tool to track progress on multi-step tasks.

## Version Control

-   Make sure that changes can be easily tracked by git.
-   **Do not use git without permission** (no `git add`, `git commit`, `git push`).
-   Instead, tell the user what changed and suggest commit messages.

# Skill Loading Rules

## The 1% Principle

**If there is even 1% possibility that a skill could be useful, load it immediately.**

Do NOT wait for explicit user request. Load skills proactively when:

-   **Keywords detected**: Any mention of skill-related paths, tools, or concepts
-   **Context matches**: Task type aligns with skill domain
-   **Uncertainty**: When unsure if skill applies, **load it** (false positive is better than false negative)

## When NOT to Load

Only skip skill loading when:

-   Task is **completely unrelated** to any available skill
-   Simple informational query that doesn't require workflows
-   User explicitly says "don't use skills"

**Default behavior**: When in doubt, **load the skill**.
