# Skills

Personal skills for Codex and Claude Code.

## Install

With Node.js, npm, and Git available, run this on each Mac:

```bash
npx skills@latest add techgerm/skills -g -a codex claude-code --skill '*' -y
```

The Skills CLI installs the shared files into `~/.agents/skills/` and creates symlinks in `~/.claude/skills/`. Codex reads the shared directory directly. Open a new agent session after installation.

## Available skills

- [pr-new](skills/pr-new/SKILL.md): Create or reuse a Linear ticket and open a GitHub pull request.
- [submit-and-monitor-pr](skills/submit-and-monitor-pr/SKILL.md): Clean up changes, run independent local review, submit through `pr-new`, and monitor CodeRabbit, Greptile, and required checks.

These workflows need GitHub access and connected Linear tooling. Independent review also needs a harness that can delegate to GPT 6.1-Sol at high reasoning effort.

## Update

Update just these skills:

```bash
npx skills@latest update -g pr-new submit-and-monitor-pr
```

To pick up newly added skills, run the install command again.

## Edit

Edit the files under `skills/` in a clone of this repository, commit, and push. Then update each Mac using the commands above. The installed files are copies managed by the Skills CLI; the Claude symlinks point to those installed copies, not to the repository checkout.

Each skill lives in `skills/<name>/SKILL.md` with `name` and `description` in its YAML frontmatter. Keep supporting files inside that skill's directory.
