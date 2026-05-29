{config, lib, pkgs, ...}:
{
environment.systemPackages = with pkgs; [
    #visual
    libGL
    mesa
    wayland
    wayland-protocols
    glib
    gtk3
    libxkbcommon
    xwayland-satellite
   #design      
    swaybg          
    wl-clipboard
    zsh
    fastfetch
    imagemagick
    lavat
    cava
    peaclock
    #utils
    git
    curl
    nftables
    yazi
    kitty
    steam-run
    #comfort
    waybar
    fuzzel
    mako  #уведы
    swaylock
    #social
    telegram-desktop
    firefox
    vesktop
    
   #screen
	grim
	slurp
	brightnessctl 
  	wireplumber
    #programming
    go
    gcc
    gnumake
    tree
    #music
	(ncmpcpp.override { visualizerSupport = true; })	
];
  environment.variables = {
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
#    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
networking.nftables.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;  
  };
services.flatpak.enable = true;
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; 
  dedicatedServer.openFirewall = true;
};
virtualisation.waydroid.enable = true;
}
