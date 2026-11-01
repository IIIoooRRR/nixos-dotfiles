{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "/etc/nixos/display/wall.jpg"
      ];
      wallpaper = [
        {
          monitor = "";
          path = "/etc/nixos/display/wall.jpg";
          # fit_mode = "cover"; # настройки режима масштабирования
        }
      ];
    };
  };
}
