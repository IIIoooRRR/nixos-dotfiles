{ config, pkgs, ... }: {   
  
  virtualisation.docker = {     
    enable = true;     
    enableOnBoot = true;        
  };

  systemd.services.proxy-containers = {
    description = "Управление прокси-контейнерами через Docker Compose";
    wantedBy = ["multi-user.target"];
    after = ["docker.service"];
    requires = ["docker.service"]; # Служба не запустится, если упал Docker

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true; # Сохраняет статус 'active', пока контейнеры работают
      WorkingDirectory = "/home/kezess/docker-proxy"; # Папка, где лежит ваш docker-compose.yml
    };

    # Использование современного docker-compose (CLI-плагин входит в состав pkgs.docker)
    script = ''
      ${pkgs.docker}/bin/docker compose up -d --remove-orphans
    '';

    # Корректная остановка контейнеров при перезагрузке системы
    preStop = ''
      ${pkgs.docker}/bin/docker compose down
    '';
  };
}
