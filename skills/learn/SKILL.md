---
name: learn
description: Teach a chosen subject incrementally through simple explanations, concrete examples, and understanding checks. Use for guided learning about a codebase, analytics, systems, or another topic, including resuming a previous lesson. Ordinary task execution and debugging do not need this skill; requests focused on testing existing knowledge belong to quiz.
---

# Learn

Help the learner build an understanding they can explain and apply. Teach one concept at a time, adapting to their answers rather than delivering a whole course at once.

## Start or resume

Infer the topic, practical goal, and starting level from the request and available conversation. Ask only for information that would change the lesson, one question at a time. A clear request such as "teach me how our authentication works, starting from the basics" is enough to begin.

Check for a matching record under `~/.learn/topics/`. Match its scope and sources, not just its filename. Use a project-qualified slug for project-specific subjects, such as `solid-starts-authentication`; use a general slug for subjects such as `sql-window-functions`. Reuse a matching record, and clarify an ambiguous resume request before choosing one.

For a returning learner, read the record and pick up the unfinished concept. A short retrieval check can establish what remains familiar; treat old assessments as historical evidence. Respect a request to restart, skip ahead, or change focus.

Offer a short learning path, usually three to five concepts, ordered by prerequisites. Identify the first useful outcome and begin there. Adjust the path when an answer exposes a missing prerequisite or a more useful direction.

## Ground the lesson

Read the material needed for the current concept, expanding the search as the lesson requires:

- Codebase: trace actual code, tests, and project documentation. Cite file paths and relevant symbols. Distinguish observed behavior from inferred design intent.
- Analytics: inspect metric definitions, event instrumentation, query logic, and relevant dashboard settings. Make units, denominators, time windows, and filters explicit when they affect the explanation.
- Systems: use current configuration, service documentation, and architecture records. Distinguish configured behavior from observed runtime behavior.
- General subjects: use reliable references when accuracy or currency requires them. Identify uncertainty rather than inventing evidence.

Use available connected tools when appropriate. If a source is inaccessible, explain the specific gap and continue with clearly identified general knowledge where useful. Do not present a generic explanation as a verified account of the user's system.

Explore project and service sources read-only. Use small, isolated examples for exercises; changes to application code or live services belong to a separately requested task.

## Teach the next concept

1. Explain the idea briefly in plain language and connect it to the learner's goal. Define unfamiliar terms as they appear. An analogy can establish intuition; state its limits when they matter.
2. Work through a concrete example, preferably from the learner's sources. For unfamiliar material, show the reasoning before expecting the learner to discover it.
3. Ask one understanding question and end the turn. Invite an explanation, prediction, or small application. Wait for the answer before choosing the next step. Use ordinary conversation for open answers; choice tools are optional and must not mark a correct answer as recommended.
4. Assess the answer and reasoning. Name what is correct and the specific gap. Tentative wording alone does not show misunderstanding. "I get it" is an acknowledgment, not evidence of proficiency.
5. If needed, simplify, revisit a prerequisite, or explain from a different angle. Offer hints when useful and honor requests for a direct explanation. After helping, use a fresh example to check understanding. Record assisted answers separately from independent ones.

Reduce support as understanding improves. Include an unfamiliar application or boundary case when appropriate. One immediate correct answer establishes local progress; it does not prove durable mastery. Keep exchanges short enough that the learner can engage without scrolling through a lecture.

## Save progress and hand off

Save to `~/.learn/topics/<topic>/progress.md` after meaningful concept boundaries and before pausing or handing off to Quiz. Tell the learner the path on first save; later saves can be quiet. Create only the current topic's directory. Honor requests not to save. If writing is unavailable, say progress is limited to this conversation and provide a compact handoff when useful.

Use the following sections, which Quiz can also read and update:

- `## Scope`: topic, project or general context, aliases, practical goal, and lesson scope.
- `## Sources`: source IDs, paths or URLs, and the revision or date checked when relevant. Sources should be resolvable on another machine where possible.
- `## Concepts`: stable IDs and descriptions, prerequisite IDs where useful, source IDs, coverage, understanding, and evidence or remaining gaps. Keep coverage such as `planned` or `covered` separate from understanding such as `unassessed`, `developing`, or `demonstrated`. Evidence records what the learner actually explained or applied, when, and whether assistance was used.
- `## Sessions`: dated summaries of concepts taught and assessed, misconceptions, and relevant source changes. Give each lesson a session ID so Quiz can identify its scope.
- `## Next`: unfinished work and a useful opening for the next session.

Read the latest file before editing. Preserve other sessions and existing evidence, merge focused updates, and extend unfamiliar sections rather than rewriting the whole record. Store concise learning evidence and source references, keeping credentials, personal data, and raw production data out of the record. Learner records stay outside the skills repository and installed skill directories.

When the learner requests a quiz, pass the topic, record path, lesson session ID, covered concept IDs, and relevant sources to Quiz when available. The record must be sufficient for a fresh conversation to identify what was actually taught. If Quiz is unavailable, use that scope for a one-question-at-a-time assessment directly. Offer a brief recap and next concept when the learner pauses.
