{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  python3Packages.pip
  cudaPackages.cudatoolkit
  cudaPackages.cudnn  
  ];
}
