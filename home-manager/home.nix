{ config, pkgs, lib, ... }:

{
  home.username = "ziggyss";
  home.homeDirectory = "/home/ziggyss";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  dconf.enable = true;

  home.packages = with pkgs; [
    # GUI Applications
    gnome-tweaks
    dconf-editor
    gparted
    pinta
    firefox
    yandex-music
    telegram-desktop
    bitwarden-desktop
    vlc

    # User-space Dev Tools
    starship
    luarocks
    tmux
    lazygit
    lazydocker
    cava
    fum
    aider-chat

    # GNOME Extensions
    gnomeExtensions.open-bar
    gnomeExtensions.media-controls
    gnomeExtensions.vitals
    gnomeExtensions.user-themes
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tiling-shell

    # Icons and Themes
    papirus-icon-theme
  ];

  imports = [
    # ./random-bg.nix
    ./dconf.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    GEM_HOME = "$HOME/.local/share/gem/ruby/3.4.0";
    GEM_PATH = "$HOME/.local/share/gem/ruby/3.4.0";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.local/share/gem/ruby/3.4.0/bin"
  ];

  programs.git = {
    enable = true;
    userName = "xDen4ik247";
    userEmail = "d.pilyugin2009@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
}
