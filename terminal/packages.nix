{lib, pkgs, ...}:
{
 home.packages = with pkgs; [
  kitty
  git
  curl
  tree
  ];
}
