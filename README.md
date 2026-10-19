# dotfiles

Managed with [chezmoi](https://www.chezmoi.io).

## Setup

```sh
chezmoi init --apply kevindurb
```

## Daily use

- `chezmoi edit ~/path/to/file` then `chezmoi apply`
- `chezmoi add ~/path/to/file` to start managing a file
- `chezmoi re-add` after editing managed files in place

## Packages

Packages are declared in [`.chezmoidata/packages.yaml`](.chezmoidata/packages.yaml)
and installed by `run_onchange_install-packages.sh.tmpl`, which re-runs whenever
the package list changes.

The lists are split by operating system (`common`, `darwin`, `linux`).

Homebrew formulae, casks, npm and uv packages are installed by Homebrew Bundle.

Flatpak packages are installed with `flatpak install --user` from the
`flathub` remote, so no root privileges are needed. They are only installed on
machines that have `flatpak` installed.
