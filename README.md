# Skills

Personal skills for Codex and Claude Code.

## Install

With Node.js, npm, and Git available, run this on each Mac:

```bash
npx skills@latest add techgerm/skills -g -a codex claude-code --skill '*' -y
```

The Skills CLI installs the shared files into `~/.agents/skills/` and creates symlinks in `~/.claude/skills/`. Codex reads the shared directory directly. Open a new agent session after installation.

## Available skills

- [learn](skills/learn/SKILL.md): Learn a chosen subject through short explanations, concrete examples, and understanding checks grounded in code, analytics, systems, or other sources.
- [quiz](skills/quiz/SKILL.md): Test knowledge one question at a time using any topic, source material, conversation, or previous Learn lesson. Works independently of Learn.
- [pr-new](skills/pr-new/SKILL.md): Create or reuse a Linear ticket and open a GitHub pull request.
- [submit-and-monitor-pr](skills/submit-and-monitor-pr/SKILL.md): Clean up changes, run independent local review, submit through `pr-new`, and monitor CodeRabbit, Greptile, and required checks.
- [unslop](skills/unslop/SKILL.md): Remove AI writing patterns and make prose clearer and more natural.

The PR workflows need GitHub access and connected Linear tooling. Independent review also needs a harness that can delegate to GPT 6.1-Sol at high reasoning effort.

## Learn and Quiz

In Codex, use `$learn` or `$quiz`. In Claude Code, use `/learn` or `/quiz`. Both skills also support plain-language requests:

```text
Teach me how authentication works in this codebase, starting from the basics.
Quiz me on everything from our last Learn session.
Quiz me on SQL window functions.
Quiz me on the event definitions and queries behind this dashboard.
```

Learn saves progress outside the codebase at `~/.learn/topics/<topic>/progress.md`, using project-qualified names such as `solid-starts-authentication` for project-specific subjects. Codex and Claude share these local records. Quiz can update a matching record or run independently without writing one. Ask either skill not to save for an in-conversation session.

The records distinguish concepts covered from understanding demonstrated, retain misconceptions and source references, and identify where to resume. The Skills CLI syncs skill definitions; it does not sync personal learning records between machines. Copy or sync `~/.learn/` separately if you want shared progress across machines, taking care with private project references.

The teaching and assessment design draws on [Agent Tutor](https://github.com/Bhala-Srinivash/agent-tutor-skill), [Tutor](https://github.com/xpressabhi/tutor), [Learn to Code with Claude](https://github.com/yanucodes/learn-to-code-with-claude), and [Learn Codebase](https://github.com/ktaletsk/learn-codebase). The skills use portable instructions without requiring their tools, storage formats, or review schedulers.

## Global instructions

The shared global instructions live in [instructions/AGENTS.md](instructions/AGENTS.md). To set them up on a new Mac:

```bash
mkdir -p ~/repos
git clone https://github.com/techgerm/skills.git ~/repos/skills
bash ~/repos/skills/scripts/setup-instructions.sh
```

If the repository is already cloned, pull its latest changes and run the setup script from that checkout.

The script creates these links:

- `~/.codex/AGENTS.md` points to `instructions/AGENTS.md` in the checkout.
- `~/.claude/CLAUDE.md` points to `~/.codex/AGENTS.md`.

Existing files or incorrect symlinks are preserved beside their original paths with a `.backup.<timestamp>` suffix. Rerunning the script leaves correct links intact. It finds the source file relative to the script, so the checkout can live anywhere. Keep the checkout in that location after setup, or rerun the script from its new location.

Pull instruction updates on each Mac with:

```bash
git -C ~/repos/skills pull --ff-only
```

Start new Codex and Claude sessions to load changed instructions. The Skills CLI manages the skills separately; its install and update commands do not set up or update these instruction links.

## Update

Update just these skills:

```bash
npx skills@latest update -g learn quiz pr-new submit-and-monitor-pr unslop
```

To pick up newly added skills, run the install command again.

## Edit

Edit the files under `skills/` in a clone of this repository, commit, and push. Then update each Mac using the commands above. The installed files are copies managed by the Skills CLI; the Claude symlinks point to those installed copies, not to the repository checkout.

Each skill lives in `skills/<name>/SKILL.md` with `name` and `description` in its YAML frontmatter. Keep supporting files inside that skill's directory.

Editing either linked global instruction file changes `instructions/AGENTS.md` in the checkout directly. Commit and push those changes, then pull them on the other Mac.
