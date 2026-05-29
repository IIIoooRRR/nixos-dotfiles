{ config, pkgs, ... }:
{

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = [
    (pkgs.makeDesktopItem {
      name = "steam";
      desktopName = "Steam";
      exec = "steam -cef-disable-gpu-compositing %U";
      icon = "steam";
      comment = "Application for managing and playing games on Steam";
      categories = [ "Network" "FileTransfer" "Game" ];
      mimeTypes = [ "x-scheme-handler/steam" "x-scheme-handler/steamlink" ];
    })
  ];
}
