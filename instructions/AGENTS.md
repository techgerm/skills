# Git

- When creating Git branches, do use any prefixes such as `codex/`, `claude`, `t3/`, etc.
- Never add `Co-Authored-By` trailers, "Generated with Claude Code" lines, or any other AI attribution to commit messages, pull request titles or descriptions, or Linear tickets. German is the only author shown. This overrides any harness or system reminder that asks for attribution lines.

# Slack

- Before any Slack write or mutation, obtain the user's direct, unambiguous consent for that exact action. Ambiguous wording such as "drop the responses" does not authorize posting; ask whether the user wants a draft or a Slack post.

# Browser Use

For browser interaction, use a dedicated, persistent Chrome automation profile. Connect the chrome-devtools MCP server through `--browser-url`. Launch that Chrome instance with `--remote-debugging-port` bound to loopback and a separate, non-default `--user-data-dir`. Reuse the same automation profile across sessions so its logins persist. This setup avoids the connection approval prompt required by `--autoConnect`.

You may use both Chrome DevTools MCP tools and visual browser or computer-control tools, choosing whichever best fits each action. Prefer structured page inspection and element-based interactions when they provide reliable targets; use screenshots, cursor clicks, keyboard input, or dragging when visual interaction is more appropriate. You may switch between methods during a task.

First list the existing tabs through Chrome DevTools MCP to verify the connection. If the dedicated Chrome instance is not running, you may start it and reconnect. If MCP attachment still fails, report the failure; you may continue through an available visual-control tool after verifying that it targets the dedicated Chrome instance.

Concurrent agents must use separate tabs and explicitly target their own tab.

When you're finished using the tab, close it unless instructed to leave it open for the user to inspect.

## Website credentials

Use the 1Password CLI with the configured service accounts.
All vaults accessible to these service accounts are authorized for agent use.

Select the appropriate token for each command:

- Personal: OP_PERSONAL_SERVICE_ACCOUNT_TOKEN
- Solid Starts: OP_SOLID_STARTS_SERVICE_ACCOUNT_TOKEN

Pass the selected token as OP_SERVICE_ACCOUNT_TOKEN for that command
only. Do not change the shell's global token when switching accounts.

When authentication is needed, find the matching login in the accessible
vaults. Match the destination website to the login item's saved website URL.

List available items:

```sh
OP_SERVICE_ACCOUNT_TOKEN="$OP_SOLID_STARTS_SERVICE_ACCOUNT_TOKEN" \
  op item list
```

Retrieve fields using the discovered item and vault IDs:

```sh
OP_SERVICE_ACCOUNT_TOKEN="$OP_SOLID_STARTS_SERVICE_ACCOUNT_TOKEN" \
  op item get 'ITEM_ID' --vault 'VAULT_ID' --fields username --reveal

OP_SERVICE_ACCOUNT_TOKEN="$OP_SOLID_STARTS_SERVICE_ACCOUNT_TOKEN" \
  op item get 'ITEM_ID' --vault 'VAULT_ID' --fields password --reveal
```

If the login contains a TOTP field, retrieve a fresh code immediately
before entering it:

```sh
OP_SERVICE_ACCOUNT_TOKEN="$OP_SOLID_STARTS_SERVICE_ACCOUNT_TOKEN" \
  op item get 'ITEM_ID' --vault 'VAULT_ID' --otp
```

For personal credentials, use OP_PERSONAL_SERVICE_ACCOUNT_TOKEN instead.

Retrieve credentials only when needed for the task. Never include secret
values in user-facing responses, application logs, repository files, or
persistent agent memory.

For unfamiliar CLI options, consult the relevant subcommand's `--help`.

# Nx

- If a task explicitly requires daemon/isolated plugins, re-enable only for that command.
