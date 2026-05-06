# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A NixOS Flakes configuration managing three x86_64-linux machines from a single repo:
- `denkplatte` — primary Intel desktop
- `freemwork` — Framework 13 laptop (Tiger Lake kernel module, IIO sensor)
- `pc` — secondary AMD desktop

All hosts share `system/`, `user/`, `programs/`, and `dm/` modules; host-specific settings live under `hosts/<hostname>/`.

## Commands

**Rebuild (format + build + commit + GC):**
```sh
./rebuild.sh
```

**Format only:**
```sh
alejandra .
```

**Build without committing:**
```sh
sudo nixos-rebuild switch --flake .#<hostname>   # e.g. .#denkplatte
sudo nixos-rebuild dry-run --flake .#<hostname>  # check without applying
```

**Garbage collect:**
```sh
sudo nix-collect-garbage --delete-older-than 14d
```

## Module Architecture

```
flake.nix          # Entry point; defines 3 nixosConfigurations
hosts/<name>/      # Per-machine: networking, audio, hardware quirks
  default.nix
  hardware-configuration.nix   # Generated; do not edit manually
system/            # Shared: systemd-boot, latest kernel, locales (Europe/Vienna, en_GB)
user/              # User "jetti": packages, groups (docker, libvirtd, wireshark…), zsh
programs/          # System packages + services: kubectl/helm, Arduino/PlatformIO,
                   # RTL-SDR, CAD tools, Julia/Octave, Docker, Tailscale, OneDrive
dm/                # KDE Plasma 6 + SDDM (Wayland); Hyprland config present but inactive
```

The `flake.nix` composes these four shared modules plus the host module for each machine. Adding a new module means creating a `default.nix` and importing it in `flake.nix` (or in an existing module's import list).

## Key Conventions

- **Formatter**: `alejandra` — run before committing (rebuild.sh does this automatically).
- **Nixpkgs channel**: `nixos-unstable` — expect occasional breakage from upstream.
- **Kernel**: `boot.kernelPackages = pkgs.linuxPackages_latest` across all hosts.
- **Desktop**: KDE Plasma 6 is active; Hyprland/COSMIC configs exist in `dm/` but are commented out in `dm/default.nix`.
- **hardware-configuration.nix** files are machine-generated — modify them only for explicit hardware tuning, and don't overwrite with a fresh `nixos-generate-config` without review.
- Commit messages are auto-generated generation numbers by `rebuild.sh`; manual commits should follow the same terse style.
