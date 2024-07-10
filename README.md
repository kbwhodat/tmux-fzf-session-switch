# TMUX FZF Session Switch

![preview img](/img/preview.png)

## QnA

### Features:

1. Fuzzy search and switch sessions and windows.
2. Create new sessions.

### What are the reasons not to use this plugin?

1. [tmux-fzf](https://github.com/sainnhe/tmux-fzf) have more black magic.
2. [tmux-fzf](https://github.com/sainnhe/tmux-fzf) have single shortcut for [switch session](https://github.com/sainnhe/tmux-fzf/issues/6) and many function [tmux-fzf](https://github.com/sainnhe/tmux-fzf) had.

### What are the reasons for using this plugin?

This plugin offers a single shortcut for switching between sessions, windows, and creating new sessions.

This creates a simple workflow: "I want to go to [session/window name], press the shortcut, type the name, and press enter. Done!"

Or:

"I want to go to [session/window name], press the shortcut, type the name. Uh oh, it doesn't exist. Okay, press `enter` to create a new session with that name."

### Plan

Blazingly fast Tmux workflow, built muscle memory, better developer experience.

### Not in plan

Having multiple features like [tmux-fzf](https://github.com/sainnhe/tmux-fzf)

## Requirements

- [Tmux >= 3.3a](https://github.com/brokenricefilms/tmux-fzf-session-switch/pull/5/files) (for the `pop-up menu` feature)
- [fzf](https://github.com/junegunn/fzf)

## Getting Started

1. **Install the Tmux Plugin Manager (TPM):**

   Follow the instructions at [https://github.com/tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) to install TPM.

2. **Add the Plugin to Your Tmux Config:**

   Add the following line to your `~/.tmux.conf` file:

   ```
   set -g @plugin 'brokenricefilms/tmux-fzf-session-switch'
   ```

3. **Install the Plugin:**

   Use TPM to install the plugin. By default, you can press `prefix + I` (where `prefix` is your tmux prefix key, usually `Ctrl + b`, and `I` is `Shift + i`).

4. **Open FZF for Session Switching:**

   Press `prefix + Ctrl + f` to open FZF in a new tab. (For example, if your prefix is `Ctrl + b`, hold `Ctrl`, press `b`, then press `f`).

   > **Known Issue:** This plugin requires more than one session to function correctly. If you only have one session, the windows won't appear in the FZF list

5. **Creating New Sessions:**

   If you type a session name that doesn't exist, you will be prompted to create it.

   * **Handling Name Conflicts:** If the name conflicts with an existing session, enclose it in double or single quotes (e.g., `'example'`).

## Customize

> 🫰Thanks to [@erikw](https://github.com/erikw)

### Search session only

```bash
set-option -g @fzf-goto-session-only 'true'
```

### Key binding

```bash
set -g @fzf-goto-session 'key binding'
```

> Eg. to override the default session switcher in tmux available at `prefix` + s`:

```bash
set -g @fzf-goto-session 's'
```

#### Without prefix

```bash
set -g @fzf-goto-session-without-prefix 'true'
```

### Window dimensions

```bash
set -g @fzf-goto-win-width WIDTH
set -g @fzf-goto-win-height HEIGHT
```

> Eg.

```bash
set -g @fzf-goto-win-width 70
set -g @fzf-goto-win-height 20
```

## Tips

**Using in the Command Line**

```bash
function tmuxSessionSwitch() {
  session=$(tmux list-windows -a | fzf | sed 's/: .*//g')
  tmux switch-client -t "$session"
}
```

```bash
function tmux_kill_uname_session() {
  echo "kill all unname tmux session"
  cd /tmp/
  tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
  sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
  chmod +x killAllUnnameTmuxSessionOutput.sh
  ./killAllUnnameTmuxSessionOutput.sh
  cd -
  tmux ls
}
```

Using this with the `clear` command is effective:

```
alias clear='tmux_kill_uname_session ; clear -x'
```
