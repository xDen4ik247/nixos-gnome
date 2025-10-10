{ pkgs, ... }:

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
      zinit light zdharma-continuum/fast-syntax-highlighting 
      zinit light zshzoo/cd-ls
      zinit light tankeryang/zsh-lsd
    '';
  };
  users.defaultUserShell = pkgs.zsh;
}
