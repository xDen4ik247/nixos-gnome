{ config, pkgs, lib, ... }:

{
  boot.kernelModules = [ "rtl8852bu" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8852bu ];

  environment.systemPackages = [ pkgs.usb-modeswitch ];

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", \
      RUN+="${lib.getExe pkgs.usb-modeswitch} -K -v 0bda -p 1a2b"
  '';
}

