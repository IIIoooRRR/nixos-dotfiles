{config, pkgs, ...}:
{
users.users.kezess = {
  isNormalUser = true;
  initialPassword = "100000";
  extraGroups = [ "wheel" "networkmanager" "video" "docker" "postgres" ];
  shell = pkgs.zsh;
	};
services.displayManager.sddm.settings = {
  Theme = {
    Font = "Noto Sans,10";
  };
};

fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-color-emoji
  nerd-fonts.jetbrains-mono
];

}
