# dotfiles

A portable development baseline — shell, editor, git, and tmux — that stays the same across machines and projects.

I have kept these configs intentionally small: enough structure to move fast, not enough ceremony to maintain a second job. No employer paths, no project-specific hooks, no framework-of-the-week. Fork what helps; ignore the rest.

**[Sean Lawlor](https://github.com/lawlorseanr)** · software engineer · former aerospace engineer

---

## Principles

| | |
|---|---|
| **Portable** | Works on a fresh Mac or Linux box with minimal setup |
| **Modular** | Zsh, git, vim, and tmux are independent — install only what you use |
| **Fork-friendly** | Personal identity lives in `~/.gitconfig.local`, not in the shared config |
| **Boring on purpose** | Defaults I still agree with six months later |

---

## Quick start

**Requires:** [zsh](https://www.zsh.org/), [git](https://git-scm.com/), [vim](https://www.vim.org/) (or point `$EDITOR` elsewhere).

```bash
git clone https://github.com/lawlorseanr/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Preview without changes:

```bash
./install.sh --dry-run
```

Then set your git identity (once):

```bash
cp ~/dotfiles/git/gitconfig.local.example ~/.gitconfig.local
${EDITOR:-vim} ~/.gitconfig.local
```

Open a new terminal (or `exec zsh`) and you are done.

---

## What's included

### Shell (`zsh/`)

- Shared history across sessions, sensible completion
- Homebrew-aware `PATH` (Apple Silicon and Intel)
- Optional [fzf](https://github.com/junegunn/fzf) defaults when installed
- Aliases and small helper functions in separate files so `.zshrc` stays readable

**Highlights**

| Helper | What it does |
|--------|----------------|
| `mkcd dir` | `mkdir -p` and `cd` in one step |
| `gclone url` | Clone a repo and `cd` into it |
| `grt` | Jump to the git root from any subdirectory |

### Git (`git/`)

- Short aliases (`st`, `lg`, `last`, …) without hiding what git is doing
- Global gitignore for OS and editor noise
- `colorMoved` and `diff3` merge conflicts — small quality-of-life wins
- **`~/.gitconfig.local`** for your name, email, and any machine-specific overrides

### Vim (`vim/`)

- 2-space indent, relative line numbers, persistent undo
- Leader key `,` with `,w` to save
- Desert colorscheme — readable everywhere, no plugin manager required

### Tmux (`tmux/`)

- Prefix `Ctrl-a` (easier reach than default `Ctrl-b`)
- Vim-style pane navigation (`h/j/k/l`)
- Mouse support, 1-based window and pane indices

### Scripts (`scripts/`)

Not symlinked by default — add `~/dotfiles/scripts` to your `PATH` if you want them.

| Script | Purpose |
|--------|---------|
| `backup-home.sh` | Tar core config files into `~/backups/` |
| `new-project.sh` | `git init` + starter `.gitignore` and README |
| `doctor.sh` | Check that expected tools are installed |

---

## Optional tools

These configs degrade gracefully without optional dependencies:

| Tool | Used for |
|------|----------|
| [Homebrew](https://brew.sh/) | `PATH` setup on macOS |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | `grep` alias, fzf file search |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finding |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexing |

Run `./scripts/doctor.sh` to see what is missing.

---

## Customization

1. **Git identity** — edit `~/.gitconfig.local` (never commit this file).
2. **Shell** — add personal aliases in `zsh/aliases.zsh` or a new file sourced from `.zshrc`.
3. **Pick and choose** — comment out any `link` line in `install.sh` you do not want.

Existing real files (not symlinks) are backed up to `~/.dotfiles-backup-<timestamp>/` before install overwrites them.

---

## Install flags

```
./install.sh              # symlink configs, seed gitconfig.local if needed
./install.sh --dry-run    # print actions only
./install.sh --help       # usage
```

---

## Forking

Feel free to fork. If you keep the structure, a few minutes of editing `gitconfig.local.example` and the zsh aliases is usually enough to make it yours. A star is optional; a PR with a clear improvement is welcome.

---

## License

[MIT](LICENSE) — use freely, attribution appreciated.
# small git alias tweak
# small git alias tweak
# small git alias tweak
# adjust vim setting
# adjust vim setting
# cleanup whitespace
# adjust vim setting
