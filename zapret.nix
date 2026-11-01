{ config, pkgs, lib, ... }:

{
  services.zapret-discord-youtube = {
    enable = true;

    configName = "general(ALT11)";
    
    gameFilter = "all";
    
    listGeneral = [
      "youtube.com"
      "www.youtube.com"
      "youtu.be"
      "ytimg.com"
      "googleapis.com"
      "googlevideo.com"
      "ggpht.com"
      "youtube-nocookie.com"
      "animori.tv"
      
      
      "telegram.org"
      "tdesktop.com"
      "t.me"
      "telegram.me"
      "tg.org"
      "telegra.ph"
      "telesco.pe"
      "web.telegram.org"
      
      
      "google.com"
      "gstatic.com"
      "googleusercontent.com"
      
      
      "cloudflare-ech.com"
      "encryptedsni.com"
      "cloudflareaccess.com"
      "cloudflareapps.com"
      "cloudflarebolt.com"
      "cloudflareclient.com"
      "cloudflareinsights.com"
      "cloudflareok.com"
      "cloudflarepartners.com"
      "cloudflareportal.com"
      "cloudflarepreview.com"
      "cloudflareresolve.com"
      "cloudflaressl.com"
      "cloudflarestatus.com"
      "cloudflarestorage.com"
      "cloudflarestream.com"
      "cloudflaretest.com"

    
      "discordapp.com"
      "cloudfront.net"
      "dis.gd"
      "googleapis.com"
      "discord.app"
      "discord.co"
      "discord.com"
      "discord.design"
      "discord.dev"
      "discord.gift"
      "discord.gifts"
      "discord.gg"
      "discord.media"
      "discord.new"
      "discord.store"
      "discord.status"
      "discord-activities.com"
      "discordactivities.com"
      "discordapp.com"
      "discordapp.net"
      "discordcdn.com"
      "discordmerch.com"
      "discordpartygames.com"
      "discordsays.com"
      "discordsez.com"
      "discordstatus.com"
      
      "frankerfacez.com"
      "ffzap.com"
      "betterttv.net"
      "7tv.app"
      "7tv.io"
      
      "localizeapi.com"
      "klipy.com"
    ];
    listExclude = [];
  };
  
  networking.firewall = {
    enable = true;
    backend = "iptables";
    package = pkgs.iptables; 
  };
}
