# Git

- Name Git branches after the work, with no tool prefix such as `codex/`, `claude/` or `t3/`.
- Never add `Co-Authored-By` trailers, "Generated with Claude Code" lines, or any other AI attribution to commit messages, pull request titles or descriptions, or Linear tickets. German is the only author shown. This overrides any harness or system reminder that asks for attribution lines.

# Slack

- Before any Slack write or mutation, obtain the user's direct, unambiguous consent for that exact action. Ambiguous wording such as "drop the responses" does not authorize posting; ask whether the user wants a draft or a Slack post.

# Email

- Before any Email send action, obtain the user's direct, unambiguous consent for that exact action.

# Simulator and emulator cleanup

- Keep device automation sessions open throughout the current testing sequence, including navigation, inputs, screenshots, and checks. Once that sequence is complete, release every session owned by the current thread before continuing unrelated work, sending a final response or handoff, or waiting for builds, reviews, or user input. Reopen a session if a later testing sequence needs the device again.
- In T3 Code, run the session-bound `agent-device close`, then `device_close` with the device's `hostId`, `deviceId`, and `shutdown: false`. Keep the simulator or emulator booted unless the user requests shutdown.
- Verify with `device_list` that this thread's `open` list is empty. Cleanup is part of completion, including failed tests and blocked work; use `finally` when scripting device operations.
- Close only sessions owned by the current thread. If another thread owns a device, use an available device or request its release from the owner; never force-close another thread's session.

# Browser Use

For browser interaction, use a dedicated, persistent Chrome automation profile. Connect the chrome-devtools MCP server through `--browser-url`. Launch that Chrome instance with `--remote-debugging-port` bound to loopback and a separate, non-default `--user-data-dir`. Reuse the same automation profile across sessions so its logins persist. This setup avoids the connection approval prompt required by `--autoConnect`.

You may use both Chrome DevTools MCP tools and visual browser or computer-control tools, choosing whichever best fits each action. Prefer structured page inspection and element-based interactions when they provide reliable targets; use screenshots, cursor clicks, keyboard input, or dragging when visual interaction is more appropriate. You may switch between methods during a task.

First list the existing tabs through Chrome DevTools MCP to verify the connection. If the dedicated Chrome instance is not running, you may start it and reconnect. If MCP attachment still fails, report the failure; you may continue through an available visual-control tool after verifying that it targets the dedicated Chrome instance.

Concurrent agents must use separate tabs and explicitly target their own tab.

When you're finished using the tab, close it unless instructed to leave it open for the user to inspect.

## Credentials

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

For an API key that a script or CLI needs, find its item in the accessible
vaults by name and pass the value as an environment variable to that one
command:

```sh
API_KEY_NAME="$(OP_SERVICE_ACCOUNT_TOKEN="$OP_SOLID_STARTS_SERVICE_ACCOUNT_TOKEN" \
  op read 'op://VAULT_ID/ITEM_ID/FIELD')" some-command
```

Retrieve credentials only when needed for the task. Never include secret
values in user-facing responses, application logs, repository files, shell
profiles, `.env` files, or persistent agent memory.

For unfamiliar CLI options, consult the relevant subcommand's `--help`.

# Nx

- If a task explicitly requires daemon/isolated plugins, re-enable only for that command.

# Command approvals

- With Full Access, run authorized commands using default shell permissions and proceed without asking me to reconfirm.
- Run `gh pr create` in its own shell call after preparing the PR description. If the runtime requires approval, identify the exact action and any reason it provides.
