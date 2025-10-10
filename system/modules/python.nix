{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
    cudatoolkit
    cudaPackages.cudnn
    linuxPackages.nvidia_x11
  ];
}
