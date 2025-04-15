{
  pkgs,
  ...
}:
{
  system.stateVersion = "24.05";

  networking.hostName = "raspi";
  users.users.root.initialPassword = "nixos";
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
}
