{ ... }:

{
  imports = [
    ./dconf.nix
    # ./random-bg.nix
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/gaming.nix
  ];
}
