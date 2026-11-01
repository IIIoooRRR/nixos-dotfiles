{lib, pkgs, config, mainUser, ...}:
{
 home.packages = with pkgs; [
 pamixer
 fuzzel
 waybar
 hyprpaper
 swaynotificationcenter
];
 imports = [
  ./waybar.nix
  ./hyprland.nix
  ./hyprpaper.nix
 ];
  wayland.windowManager.hyprland.systemd.enable = false;
}
