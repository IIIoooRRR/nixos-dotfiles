{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12pt;
        font-weight: bold;
        border-radius: 8px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red {
        to {
          background-color: rgb(242, 143, 173);
          color: rgb(26, 24, 38);
        }
      }
      .warning, .critical, .urgent {
        animation-name: blink_red;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        margin-left: 5px;
        margin-right: 5px;
        margin-top: 5px;
        background-color: #1e1e2a;
        padding: 3px;
        padding-left: 8px;
        border: 2px none #33ccff;
      }
      #workspaces {
        padding-left: 0px;
        padding-right: 4px;
      }
      #workspaces button {
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 6px;
        padding-right: 6px;
      }
      #workspaces button.active {
        background-color: rgb(181, 232, 224);
        color: rgb(26, 24, 38);
      }
      #workspaces button.urgent {
        color: rgb(26, 24, 38);
      }
      #workspaces button:hover {
        background-color: rgb(248, 189, 150);
        color: rgb(26, 24, 38);
      }
      tooltip {
        background: rgb(48, 45, 65);
      }
      tooltip label {
        color: rgb(217, 224, 238);
      }
      #custom-launcher {
        font-size: 20px;
        padding-left: 8px;
        padding-right: 6px;
        color: #7ebae4;
      }
      #window, #clock, #memory, #temperature, #cpu, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-notification {
        padding-left: 10px;
        padding-right: 10px;
      }
      #memory { color: rgb(181, 232, 224); }
      #cpu { color: rgb(245, 194, 231); }
      #clock { color: rgb(217, 224, 238); }
      #temperature { color: rgb(150, 205, 251); }
      #backlight { color: rgb(248, 189, 150); }
      #pulseaudio { color: rgb(245, 224, 220); }
      #network { color: #ABE9B3; }
      #network.disconnected { color: rgb(255, 255, 255); }
      #custom-powermenu { color: rgb(242, 143, 173); padding-right: 8px; }
      #tray { padding-right: 8px; padding-left: 10px; }
      #custom-notification { color: #33ccff; }
      #window { color: #c0caf5; }
    '';
    settings = [{
      "layer" = "top";
      "exclusive" = true;
      "position" = "top";
      
      # модули слева: launcher, workspaces, активное окно
      modules-left = [
       "group/drawer-menu" 
       "hyprland/workspaces" # нативные воркспейсы Hyprland
      ];

     "group/drawer-menu" = {
       "orientation" = "vertical";
       "drawer" = {
         "transition-duration" = 300;
         "click-to-reveal" = true;
         };
        "modules" = [
          "custom/leader-icon"
          ];
        };
      # часы 
      modules-center = [
        "clock"
      ];
  "custom/leader-icon" = {
        "format" = " ";
        "tooltip" = false;
     };


      # модули справа: уведомления, звук, сеть, ресурсы, выключение
      modules-right = [
        "custom/notification"
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "custom/powermenu"
        "tray"
      ];


      # уведомления
      "custom/notification" = {
        "tooltip" = false;
        "format" = "{icon}";
        "format-icons" = {
          "notification" = "<span foreground='red'><sup></sup></span>";
          "none" = "";
          "dnd-notification" = "<span foreground='red'><sup></sup></span>";
          "dnd-none" = "";
          "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
          "inhibited-none" = "";
          "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
          "dnd-inhibited-none" = "";
        };
        "return-type" = "json";
        "exec-if" = "which swaync-client";
        "exec" = "swaync-client -swb";
        "on-click" = "swaync-client -t -sw";
        "on-click-right" = "swaync-client -d -sw";
        "escape" = true;
      };

      # звук
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = {
          "default" = [ "" "" "" ];
        };
        "on-click" = "pamixer -t";
        "tooltip" = false;
      };

      # часы с календарем
      "clock" = {
        "interval" = 1;
        "format" = "{:%I:%M %p  %A %b %d}";
        "tooltip" = true;
        "tooltip-format" = "{=%A; %d %B %Y}\n<tt>{calendar}</tt>";
      };

      # память
      "memory" = {
        "interval" = 1;
        "format" = "󰻠 {percentage}%";
        "states" = {
          "warning" = 85;
        };
      };

      # процессор
      "cpu" = {
        "interval" = 1;
        "format" = "󰍛 {usage}%";
      };

      # сеть
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰒢 Connected!";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "tooltip" = false;
      };

      # кнопка выключения
      "custom/powermenu" = {
        "format" = "";
        "on-click" = "poweroff";
        "tooltip" = false;
      };

      # cистемный трей
      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
    }];
  };
}
