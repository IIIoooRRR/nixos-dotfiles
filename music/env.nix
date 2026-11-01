{ pkgs, config, ... }:

{
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override { visualizerSupport = true; };
  };
  services.mpd = {
  enable = true;
  musicDirectory = "${config.home.homeDirectory}/Music";
  extraConfig = ''
    audio_output {
        type            "pulse"
        name            "PipeWire Sound Server"
    }
  '';
};

}
