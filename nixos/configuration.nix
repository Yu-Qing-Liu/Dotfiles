{ inputs, config, pkgs, zoomPkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 1;
  
  # Network
  networking.hostName = "yql";
  networking.wireless.iwd.enable = true;
  # networking.proxy.httpsProxy = "http:127.0.0.1:3128";
  # networking.proxy.httpProxy = "http:127.0.0.1:3129";
  services.openssh.settings.PasswordAuthentication = true;
  services.openssh.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Configure console keymap
  console.keyMap = "us";
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Timezone
  time.timeZone = "America/Toronto";

  # Nvidia Config
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.nvidia.prime = {
    sync.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # add /.local to $PATH
  environment.variables={
    NIXOS_OZONE_WL = "1";
    PATH = [
      "\${HOME}/.local/bin"
    ];
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_BROKEN = "1";
  };
  
  # System packages
  environment.systemPackages = with pkgs; [
    libevdev
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    docker
    docker-buildx
    nvidia-docker
    zoomPkgs.zoom-us
  ];
  
  # App settings
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };
  
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.docker.enable = true;
  
  # Users
  programs.zsh.enable = true;
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ 
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };
  
  # Autologin
  systemd.services."getty@tty1" = {
  overrideStrategy = "asDropin";
  serviceConfig.ExecStart = ["" "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${config.services.getty.loginProgram} --autologin admin --noclear --keep-baud %I 115200,38400,9600 $TERM"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Garbage colector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  
  # System version
  system.stateVersion = "25.05";
  
  #Flakes
  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
