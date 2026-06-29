# dotfiles

My personal macOS setup — a from-scratch "rice" built around tiling window management, a custom status bar, and a clean terminal. Originally inspired by a Reddit setup, then heavily customized from there.

**Stack:** [AeroSpace](https://github.com/nikitabobko/AeroSpace) (tiling WM) · [SketchyBar](https://github.com/FelixKratz/SketchyBar) (status bar) · [kitty](https://sw.kovidgoyal.net/kitty/) (terminal) · [boringNotch](https://github.com/TheBoredTeam/boring.notch) (notch utility)

## Structure

```
dotfiles/
├── aerospace/
│   └── aerospace.toml          # tiling WM config, keybinds, workspaces, gaps
├── sketchybar/
│   ├── sketchybarrc            # bar entry point: layout, item order, colors
│   └── plugins/
│       ├── workspace.sh        # workspace pills + active highlighting
│       ├── focused_window.sh   # shows name of focused window/app
│       ├── battery.sh          # battery % with state-based color
│       ├── network.sh          # connectivity icon (route-based check)
│       ├── volume.sh           # volume widget (volume_change event)
│       ├── clock.sh            # date/time pill
│       └── icon_map.sh         # app -> glyph mapping (sketchybar-app-font)
└── kitty/
    └── kitty.conf              # terminal config, font, theme, keybinds
```

boringNotch isn't included here — it's a GUI app with no portable dotfile; just reinstall and reconfigure via its settings UI.

## Install

These configs expect to live under `~/.config/`. Symlink them into place from the repo:

```bash
ln -sf ~/documents/programming/dotfiles/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
ln -sf ~/documents/programming/dotfiles/sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc
ln -sf ~/documents/programming/dotfiles/sketchybar/plugins ~/.config/sketchybar/plugins
ln -sf ~/documents/programming/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

### Dependencies

```bash
brew install --cask nikitabobko/tap/aerospace
brew install felixkratz/formulae/sketchybar
brew install --cask kitty
brew install sketchybar-app-font   # for workspace app icons
```

SketchyBar runs as a background service:

```bash
brew services start sketchybar
```

## Notes

- **AeroSpace ↔ SketchyBar** are wired together via `exec-on-workspace-change` in `aerospace.toml`, calling SketchyBar at its absolute path (`/opt/homebrew/bin/sketchybar`) to avoid `PATH` issues when triggered from a subprocess.
- Colors are currently **inline** across `sketchybarrc`, `workspace.sh`, `network.sh`, and `battery.sh` (Catppuccin Mocha palette), rather than centralized — a `colors.sh` refactor is a known TODO if I want one-file retheming later.
- `kitty.conf` is on a separate light pastel-blue theme — the bar palette doesn't currently match it. Known, intentional for now.

## TODO

- [ ] Extract SketchyBar colors into a single `colors.sh`
- [ ] Decide on matching kitty + SketchyBar palettes (or keep them independent)
- [ ] Add install script to automate symlinking