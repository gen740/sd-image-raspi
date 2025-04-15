# Usage

You can build sd-card image of raspberry pi 4 with
```bash
nix build --experimental-features 'nix-command flakes' -L .#nixosConfigurations.raspi.config.system.build.sdImage
```
