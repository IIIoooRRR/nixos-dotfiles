{config, lib, pkgs, ...}:
{
 i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
    # supportedLocales = all;
  };
environment.systemPackages = with pkgs; [
    #visual
    libGL
    mesa
    wayland
    wayland-protocols
    glib
    gtk3
    libxkbcommon
    xdg-desktop-portal-gtk
   #design               
    wl-clipboard
    imagemagick
    #utils
    steam-run
    iptables
    blockbench
    onlyoffice-desktopeditors
    #social
    telegram-desktop
    firefox
    vesktop   
    #term
    fish	

   #screen
    grim
    slurp
    #games
    umu-launcher
    #programming
    jdk21
    jdk17
    jdk25
    go_1_27
    gcc
    gnumake
    gopls
    gotools
];

fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-color-emoji
  nerd-fonts.jetbrains-mono
];
services.flatpak.enable = true;
programs.dconf.enable = true; # программа сохранения настроек
}
