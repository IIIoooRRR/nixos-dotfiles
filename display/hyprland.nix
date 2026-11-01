{ config, pkgs, ... }:
let
  mod = "SUPER";
in
{
  wayland.windowManager.hyprland = {
    configType = "hyprlang";
    enable = true;
    package = null; 
    portalPackage = null;
    extraConfig = ''
'';
    submaps.resize.settings = {
      binde = [
        ", right, resizeactive, 10 0"
        ", left, resizeactive, -10 0"
        ", up, resizeactive, 0 -10"
        ", down, resizeactive, 0 10"
      ];
      bind = [
        ", escape, submap, reset"
      ];
    };

    settings = {      
     env = [
  	"XCURSOR_THEME,Bibata-Modern-Classic"
  	"XCURSOR_SIZE,12"
        "GDK_SCALE,1"
      "QT_AUTO_SCREEN_SCALE_FACTOR,0"
      "QT_SCALE_FACTOR,1"
     ];
     monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      ", preferred, 1920x0, 1"
    ];
    xwayland = {
      force_zero_scaling = true;
    }; 
     input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
      };
     general = {
      gaps_in = 5; 
      gaps_out = 5; 
      border_size = 1;
     };
      decoration = {
        rounding = 15;
        active_opacity = 0.9;
        inactive_opacity = 0.85;
      };
     windowrule = [
       "match:class ^(org.vinegarhq.Sober)$, opaque on"
         "match:class ^(org.vinegarhq.Sober)$, fullscreen on"
     ];


      "exec-once" = [
  "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
  "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
  
  "sleep 1 && systemctl --user restart xdg-desktop-portal xdg-desktop-portal-hyprland"

  "${pkgs.waybar}/bin/waybar"
  "${pkgs.hyprpaper}/bin/hyprpaper"
  "hyprctl setcursor Bibata-Modern-Classic 12"
  "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'"
  "gsettings set org.gnome.desktop.interface cursor-size 12"
];


      "terminal" = "${pkgs.kitty}/bin/kitty";
      "menu" = "${pkgs.fuzzel}/bin/fuzzel";
      bind = [
        "${mod}, D, exec, fuzzel"
        "${mod}, T, exec, kitty"
        "${mod}, W, exec, firefox"
        "${mod}, G, exec, steam-run GoLand-2026.1/bin/goland.sh"


        "${mod}, Q, killactive,"

        # Звук
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioMute, exec, pamixer -t"

        ", XF86MonBrightnessDown, exec, brightnessctl -q s 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl -q s +10%"

        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod}, 8, workspace, 8"
        "${mod}, 9, workspace, 9"

        "${mod} SHIFT, 1, movetoworkspace, 1"
        "${mod} SHIFT, 2, movetoworkspace, 2"
        "${mod} SHIFT, 3, movetoworkspace, 3"
        "${mod} SHIFT, 4, movetoworkspace, 4"
        "${mod} SHIFT, 5, movetoworkspace, 5"
        "${mod} SHIFT, 6, movetoworkspace, 6"
        "${mod} SHIFT, 7, movetoworkspace, 7"
        "${mod} SHIFT, 8, movetoworkspace, 8"
        "${mod} SHIFT, 9, movetoworkspace, 9"


        "${mod} CTRL, left, movewindow, l"
        "${mod} CTRL, right, movewindow, r"
        "${mod} CTRL, up, movewindow, u"
        "${mod} CTRL, down, movewindow, d"
        
        # Плавающий режим
        "${mod}, V, togglefloating,"
        "${mod}, C, centerwindow,"
        "${mod}, left, movefocus, l"
        "${mod}, right, movefocus, r"
        "${mod}, up, movefocus, u"
        "${mod}, down, movefocus, d"

        "${mod}, R, submap, resize" 
        
        "${mod} SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"
         "${mod}, S, exec, grim - | wl-copy"    
      ];

      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:274, resizewindow"
      ];
    };
  };
}
