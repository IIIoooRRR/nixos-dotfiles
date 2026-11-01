{pkgs, config, ...}:
{
home.packages = with pkgs; [
fastfetch
];
 imports = [
 ./fastfetch.nix
 ./packages.nix
  ./kitty.nix
 ];  
}
