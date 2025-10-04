{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/wifi.nix
    ./modules/boot.nix
    ./modules/shell.nix
  ];
}
