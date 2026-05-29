{config, pkgs, ...}:
{
hardware.steam-hardware.enable = true;
services.throttled.enable = true;
hardware.graphics = {
  enable = true;
  enable32Bit = true;
};
}
