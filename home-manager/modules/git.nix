{ config, ... }:

{
  programs.git = {
    enable = true;
    userName = "xDen4ik247";
    userEmail = "d.pilyugin2009@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
