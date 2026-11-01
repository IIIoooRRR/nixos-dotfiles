{ config, pkgs, ... }:

{
    home.file.".config/fastfetch/config.jsonc".text = ''
      {
        "$schema": "https://github.com",
        "logo": {
          "source": "/etc/nixos/terminal/png.png",
          "type": "kitty-direct", // Прямой вывод графики
          "width": 35,  // Ширина в символах
          "height": 16, // Высота в символах
          "padding": {
            "top": 1,
            "left": 2,
            "right": 4
          }
        },
        "display": {
          "separator": " ➜ ",
          "color": {
            "keys": "magenta",
            "title": "magenta"
          }
        },
        "modules": [
          "title",
          { "type": "separator", "string": "─" },
          { "type": "os", "key": " ", "keyColor": "magenta" },
          { "type": "kernel", "key": " ", "keyColor": "magenta" },
          { "type": "shell", "key": " ", "keyColor": "magenta" },
          { "type": "memory", "key": " ", "keyColor": "magenta" },
          "break",
          "colors"
        ]
      }
    '';
}
