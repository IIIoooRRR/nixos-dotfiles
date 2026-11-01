{ config, pkgs, mainUser, ... }:

{
  home.stateVersion = "26.05"; 
  home.username = mainUser;
  home.homeDirectory = "/home/${mainUser}";
   
  # пользовательские пакеты
  home.packages = with pkgs; [
  ];

home.pointerCursor = {
  gtk.enable = true;
  x11.enable = true;
  package = pkgs.bibata-cursors;
  name = "Bibata-Modern-Classic";
  size = 12;
};

}
