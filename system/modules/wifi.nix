{ config, pkgs, lib, ... }:

let
  baseRtl = if builtins.hasAttr "rtl8852bu" pkgs then pkgs.rtl8852bu else config.boot.kernelPackages.rtl8852bu;
  rtl8852buPatched = baseRtl.overrideAttrs (old: rec {
    postPatch = (old.postPatch or "") + ''
      if [ -f include/osdep_service_linux.h ]; then
        awk 'BEGIN{
print "#ifndef from_timer"
print "#define from_timer(var, callback_timer, field) \\"
print "  container_of(callback_timer, typeof(*var), field)"
print "#endif"
}
{print}' include/osdep_service_linux.h > /tmp/osdep_new || true
        mv /tmp/osdep_new include/osdep_service_linux.h || true
      fi
      grep -R -l "from_timer" . >/tmp/_fm || true
      if [ -s /tmp/_fm ]; then
        while IFS= read -r f; do
          sed -i 's/from_timer/timer_container_of/g' "$f" || true
        done </tmp/_fm
      fi
    '';
  });
in
{
  boot.kernelModules = [ "8852bu" ];
  boot.extraModulePackages = [ rtl8852buPatched ];

  environment.systemPackages = [ pkgs.usb-modeswitch ];

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", \
      RUN+="${lib.getExe pkgs.usb-modeswitch} -K -v 0bda -p 1a2b"
  '';
}

