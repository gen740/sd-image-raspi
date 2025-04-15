{
  description = "Cross-compile NixOS SD image for Raspberry Pi 4";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs =
    {
      nixpkgs,
      nixos-hardware,
      ...
    }:
    {
      nixosConfigurations.raspi = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        pkgs = import nixpkgs {
          system = "aarch64-linux";
          overlays = [
            (final: super: {
              makeModulesClosure = x: super.makeModulesClosure (x // { allowMissing = true; });
            })
          ];
        };
        modules = [
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ./configuration.nix
          nixos-hardware.nixosModules.raspberry-pi-4
        ];
      };
    };
}
