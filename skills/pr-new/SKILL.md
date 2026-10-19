---
name: pr-new
description: Create or reuse a Linear ticket from the current work and open a matching GitHub pull request. Use when the user invokes this skill.
---

# Create a PR with a new or existing Linear ticket

Create a Linear ticket automatically unless the user provides an existing one, then open the pull request. If you're creating a new Linear ticket, do not ask the user for permission to create one.

## Issue type classification

This is only relevant when creating a new Linear ticket.
Before creating the Linear ticket, choose exactly one of these workspace-level type labels:

- `Feature` — Introduces a new user-facing capability, workflow, or behavior.
- `Bug` — Corrects broken, unintended, or regressed behavior.
- `Improvement` — Meaningfully enhances an existing capability's usability, accessibility, performance, reliability, or quality without introducing a fundamentally new capability.
- `Task` — Internal or operational work such as refactoring, migrations, dependencies, configuration, tooling, tests, documentation, research, maintenance, or release work.

Classify the work by its primary outcome, using the request, code changes, commits, and repository context. Apply `Task` when none of the other types is a clear fit. Explicit user instructions about the issue type take precedence. Do not ask the user to choose a type.

## Workflow

1. Inspect the current request, Git changes, branch, commits, and repository context to understand the work.
2. Classify the work and select exactly one issue type label according to the issue type classification rules.
3. If a Linear ticket was not provided by the user, use the connected Linear tooling to create a ticket with the selected type label and a minimal title and description that accurately summarize the work.
4. Assign the ticket to its reporter.
5. Add the ticket to the current active cycle.
6. Transition the ticket to `In Progress`.
7. Prepare the branch and changes for publication, following the repository's Git and validation instructions.
8. Format the pull request title as:

   ```text
   Linear_Ticket_Number: TITLE
   ```

9. Format the pull request description as:

   ```markdown
   ### Summary

   - Concise summary item
   - Concise summary item

   Fixes Linear ticket link
   ```

   Keep the `Fixes` line at the end of the summary. Use the full Linear ticket URL so Linear creates a `Resolves` link and applies the configured merge-status automation.

10. Create the pull request as open and ready for review, not as a draft.
11. Assign the pull request to the author submitting it. Do not add reviewers.
12. When relevant, include screenshots and videos in the PR as well.

## Guardrails

- Create exactly one new Linear ticket for the pull request unless the user explicitly requests more.
- Do not ask the user to supply a ticket, ticket title, or ticket description; derive these from the work.
- Apply exactly one of `Feature`, `Bug`, `Improvement`, or `Task` to the new ticket.
- Do not open the pull request until the ticket has been created and its number and link are available.
- Link the pull request with the closing magic word `Fixes`. A bare Linear ticket URL creates a `Related` link and does not move the ticket when the pull request merges.
- Follow all repository-local instructions and required checks before opening the pull request.
