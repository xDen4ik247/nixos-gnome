{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs [
    steam-desktop
    bottles
    lutris
  ]; 
}
