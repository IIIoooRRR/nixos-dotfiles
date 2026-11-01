{config, pkgs, mainUser, ... }:
{
#  swapDevices = [
#    { device = "/var/lib/swapfile"; size = 8192; }
#  ];
  hardware = {
    steam-hardware.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [ 
        intel-media-driver
        vulkan-loader
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ 
        intel-vaapi-driver
        vulkan-loader
      ]; 
    };
  };
  home-manager.users.${mainUser} = {
    home.file.".android/advancedFeatures.ini".text = ''
    Vulkan = off
    GLDirectMem = on
    '';
  };
  networking.firewall = {
  allowedTCPPorts = [ 25565 ];
  allowedUDPPorts = [ 25565 ];
 };
}
