{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/nvidia.nix
    ./modules/wifi.nix
    ./modules/bootloader.nix
    ./modules/shell.nix
  ];
}
