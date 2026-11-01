{
  description = "NixOS config with Hyprland, Home Manager and zapret";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      mainUser = "kezess";

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit mainUser; };

        modules = [
  ./configuration.nix

  # zapret
  inputs.zapret-discord-youtube.nixosModules.withTestTools
  {
    services.zapret-discord-youtube = {
      enable = true;
      configName = "general(ALT11)";
      gameFilter = "all";
      listGeneral = [
    "youtube.com"
    "www.youtube.com"
    "youtu.be"
    "googlevideo.com"
    "ytimg.com"

    "discord.com"
    "discordapp.com"
    "discord.gg"
    "discordapp.net"
 ];
      listExclude = [ "ubisoft.com" "origin.com" ];
      ipsetAll = [ "192.168.1.0/24" "10.0.0.1" ];
      ipsetExclude = [ "203.0.113.0/24" ];
    };
  }

  # home manager
  home-manager.nixosModules.home-manager
  {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
    home-manager.sharedModules = [
      ./display/env.nix
      ./terminal/env.nix
      ./music/env.nix
    ];
    home-manager.extraSpecialArgs = { inherit mainUser inputs; };
    home-manager.users.${mainUser} = import ./home.nix;
  }
];
      };
    };
}
