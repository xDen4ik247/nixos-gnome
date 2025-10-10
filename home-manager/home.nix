{ pkgs, ... }:

{
  imports = [
    ./imports.nix
  ];

  programs.home-manager.enable = true; 

  home = {
    username = "ziggyss";
    homeDirectory = "/home/ziggyss";
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "firefox";
      GEM_HOME = "$HOME/.local/share/gem/ruby/3.4.0";
      GEM_PATH = "$HOME/.local/share/gem/ruby/3.4.0";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.local/share/gem/ruby/3.4.0/bin"
    ];
  };

  dconf.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
}
