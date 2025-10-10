{ config, pkgs, ... }:

{
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
    devenv
    luarocks
    tmux
    lazygit
    lazydocker
    cava
    fum
    aider-chat
    ani-cli

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
}
