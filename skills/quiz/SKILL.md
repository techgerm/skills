---
name: quiz
description: Test existing knowledge of any topic, codebase, analytics definition, system, source file, or recent conversation, one question at a time. Use for quizzes, explain-back checks, and knowledge-gap assessments, including testing a previous Learn lesson. Works without Learn, a saved learning record, or a study vault. Guided teaching of unfamiliar material belongs to learn.
---

# Quiz

Find what the learner can explain and apply independently, and where their understanding needs work. A previous Learn session is optional.

## Choose the scope and sources

Use the request to select the input:

- **Named topic:** start an assessment of that topic directly. No profile, learning history, lesson, or setup menu is required. Infer a reasonable starting level and adapt to the answers.
- **File, document, codebase, or system:** read the relevant source before forming questions and expected answers. Trace enough surrounding context to avoid testing an assumption as fact.
- **Current conversation:** test the concepts, code, and decisions actually discussed. Check current source material where the conversation is incomplete or potentially stale.
- **Previous Learn lesson:** use its handoff or matching `~/.learn/topics/<topic>/progress.md`. Resolve the lesson session and covered concept IDs. For "everything we just learned," include every covered concept in that session, excluding merely planned concepts. For a broader request, use the requested lessons or topic scope.

Match saved records by scope and sources, not just slug. If "last lesson" cannot be resolved from the conversation or records, ask which topic or lesson. If no record exists, use available conversation or sources. If those are also absent, ask for the topic or material; do not invent a prior lesson or require Learn first.

For a project-specific quiz, verify answers against the user's actual implementation, metric definitions and query settings, or system documentation. Clearly distinguish generic knowledge and inferred rationale from verified behavior. Recheck source changes that could invalidate an old lesson. If a changed implementation is being tested, explain that scope change without revealing the answer. If the requested historical version is unavailable, say so.

## Plan coverage

Choose a short initial round unless the learner specifies a length or time budget. For a recent lesson, plan enough questions to assess each covered concept, possibly across several rounds. Maintain an assessed/unassessed list so adapting difficulty does not silently skip concepts. If the learner stops early, name what remains unassessed.

Mix question forms that fit the subject: explain a mechanism, predict behavior, interpret a query or chart, diagnose a failure, compare choices, or apply an idea in a new situation. Use varied scenarios rather than repeating lesson wording. For a lesson quiz, keep the tested concepts within what was taught; label optional extensions as challenges outside the assessed lesson scope.

Establish the expected answer and its source before asking. For a program-output question, verify a safe isolated snippet when feasible; otherwise identify that execution was not verified. Keep exploration read-only and avoid running examples with live side effects. Withhold answer-bearing citations and excerpts until grading, unless the learner requests an open-book quiz.

## Ask, wait, assess

Ask **one question per turn**, then end the turn and wait for the learner's response. Use ordinary conversation for open answers. Do not include a solution, rubric, suggestive explanation, or the next question before they answer. For multiple choice, use plausible alternatives, vary the correct answer's position, and avoid preselected or recommended answers and descriptions that reveal correctness.

Judge the answer and its reasoning against the established evidence:

- **Independent and sound:** the explanation or application is correct for the question's scope.
- **Partial:** some reasoning is correct, but a specific gap remains. A correct conclusion based on a wrong mechanism belongs here.
- **Incorrect or unknown:** a substantive error, or "I don't know." Treat either as useful information and respond directly and kindly.
- **Assisted:** record hints, corrections, or other help separately, even if the eventual answer is correct.

Ask a focused follow-up when the answer is ambiguous or unsupported, before settling the assessment. Tentative wording, brevity, and confidence are not evidence by themselves. Accept equivalent explanations and justified alternatives. If the question is ambiguous or its expected answer is wrong, repair or replace it without counting that against the learner.

Give concise feedback after an attempt, naming the correct reasoning and exact gap. Adapt the next question to probe that gap or increase difficulty. In practice, explain missed ideas and later revisit them with a fresh question. A success immediately after correction is assisted practice, not proof of independent retention. When the learner requests exam conditions, defer corrections until the end and keep subsequent questions from disclosing earlier answers. Honor requests for hints or solutions while recording the assistance.

## Save and close

An existing learning record is optional. When one matches, save concise assessment evidence there after meaningful checkpoints and at the end. For a standalone quiz with no record, default to in-conversation results and offer to save at the end. Honor no-save requests. If saving is requested, use `~/.learn/topics/<topic>/progress.md`, with a project-qualified slug for project-specific subjects.

Use or preserve these sections so Learn can resume from the result:

- `## Scope`: topic, project or general context, aliases, goal, and assessment scope.
- `## Sources`: source IDs, resolvable paths or URLs, and relevant revisions or dates checked.
- `## Concepts`: stable concept IDs, source IDs, coverage, understanding, and evidence or gaps. Keep lesson coverage separate from assessment. A quiz alone does not establish that a concept was taught; new standalone concepts can have `not taught` coverage. Record `unassessed`, `developing`, or `demonstrated` understanding using actual answers and the assistance used.
- `## Sessions`: dated quiz scope, questions summarized, findings, and the linked lesson session ID when applicable.
- `## Next`: concepts still unassessed and useful review or follow-up probes.

Read the latest record before editing and merge focused updates. Preserve lesson coverage, other sessions, and historical evidence. Store short question and answer summaries, specific misconceptions, and assistance used; do not store credentials, personal data, or raw production data. If writing fails, report that results were not saved and keep the quiz useful in this conversation.

At the end, report demonstrated strengths, developing concepts, gaps, assistance used, and any unassessed scope. State what the answers support without assigning a precise proficiency percentage to an adaptive sample. Include a short review suggestion and the save path when applicable. Keep extended re-teaching separate from the assessment unless the learner asks to work through a gap.
