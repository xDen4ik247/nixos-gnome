{ config, pkgs, ... }:

{ 
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellInit = ''
      source "${pkgs.zinit}/share/zinit/zinit.zsh"
    '';
    interactiveShellInit = ''
      zinit light nullxception/roundy
      zinit light zsh-users/zsh-completions
      zinit light zsh-users/zsh-autosuggestions
      zinit light zdharama-continuum/fast-syntax-highlighting 
      zinit light MohamedElashri/adguard-helper
      zinit light chrissicool/zsh-256color

    '';
  };
  users.defaultUserShell = pkgs.zsh;
}
