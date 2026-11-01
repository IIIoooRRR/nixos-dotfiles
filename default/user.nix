{config, pkgs, mainUser, ...}:
{
 imports = [
 ./docker.nix
 ./database.nix
 ];
  nix.settings.trusted-users = [ "root" "${mainUser}"];
  programs.fish.enable = true;
  users.users.${mainUser} = {
    isNormalUser = true;
    initialPassword = "100000";
    extraGroups = [ "wheel" "networkmanager" "video" "docker" "postgres" ];
    shell = pkgs.fish;
    };
}
