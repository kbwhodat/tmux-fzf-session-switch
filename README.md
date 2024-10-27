# TMUX FZF Session Switch

![](https://private-user-images.githubusercontent.com/63371699/380459035-512b0025-9d98-4895-978a-05bc44d6342a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzAwMTkxMzIsIm5iZiI6MTczMDAxODgzMiwicGF0aCI6Ii82MzM3MTY5OS8zODA0NTkwMzUtNTEyYjAwMjUtOWQ5OC00ODk1LTk3OGEtMDViYzQ0ZDYzNDJhLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEwMjclMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMDI3VDA4NDcxMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWJmM2M3MzMyN2ZhYzA2ODBlZjdjYmVkMjJhMDkyYTUwZTRiN2NkYTVhZjYzMDc1YzMzM2NlNDdlMTM3OWJkODgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.h2rnkz_BCWbntCP-I0gWFK5eV8t0YQYtAXN4wtiU5TA)

## Video demo

[![](/img/video-demo-thumbnail.jpg)](https://www.youtube.com/watch?v=70jzB1SU5as)

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

5. **Creating New Sessions:**

   If you type a session name that doesn't exist, you will be prompted to create it.

   * **Handling Name Conflicts:** If the name conflicts with an existing session, enclose it in double or single quotes (e.g., `'example'`).

## Customize

> 🫰Thanks to [@erikw](https://github.com/erikw) and [adia-dev](https://github.com/adia-dev)

### Search session only

```bash
set-option -g @fzf-goto-session-only 'true'
```

### Key binding

```bash
set -g @fzf-goto-session 'key binding'
```

> Eg. to override the default session switcher in tmux available at `prefix + s`:

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

### Preview window on the side

![](https://private-user-images.githubusercontent.com/63371699/380459035-512b0025-9d98-4895-978a-05bc44d6342a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzAwMTkxMzIsIm5iZiI6MTczMDAxODgzMiwicGF0aCI6Ii82MzM3MTY5OS8zODA0NTkwMzUtNTEyYjAwMjUtOWQ5OC00ODk1LTk3OGEtMDViYzQ0ZDYzNDJhLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEwMjclMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMDI3VDA4NDcxMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWJmM2M3MzMyN2ZhYzA2ODBlZjdjYmVkMjJhMDkyYTUwZTRiN2NkYTVhZjYzMDc1YzMzM2NlNDdlMTM3OWJkODgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.h2rnkz_BCWbntCP-I0gWFK5eV8t0YQYtAXN4wtiU5TA)

```bash
set -g @fzf-goto-preview-enabled 'true'
set-g @fzf-goto-preview-width-preview WIDTH
set-g @fzf-goto-preview-height-preview HEIGH
```

## Tips

**Using in the Command Line**

```bash
function tmux_session_switch() {
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
