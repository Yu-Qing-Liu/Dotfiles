{ inputs, config, pkgs, zoomPkgs, blenderPkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 1;

  # Network
  networking.hostName = "yql";
  # networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;
  # networking.proxy.httpsProxy = "http:127.0.0.1:3128";
  # networking.proxy.httpProxy = "http:127.0.0.1:3129";
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 8070 49153 ];
    allowedUDPPortRanges = [
      {
        from = 4000;
        to = 4007;
      }
      {
        from = 8000;
        to = 8010;
      }
      {
        from = 49153;
        to = 49154;
      }
    ];
  };

  services.openssh.settings.PasswordAuthentication = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

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

  # Battery Settings
  services.system76-scheduler.settings.cfsProfiles.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };
  services.power-profiles-daemon.enable = false;
  powerManagement.powertop.enable = false;
  services.thermald.enable = true;

  # Printers
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplip ];
    webInterface = true;
  };

  hardware.printers = {
    ensureDefaultPrinter = "HP_M139w";
    ensurePrinters = [
      {
        name = "HP_M139w";
        location = "Home";
        deviceUri = "ipp://10.0.0.117:631/ipp/print";
        model = "everywhere";
      }
    ];
  };

  # Timezone
  time.timeZone = "America/Toronto";

  # Nvidia Config
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ intel-media-driver libva-vdpau-driver libvdpau-va-gl ];
  };
  services.xserver.videoDrivers = [ "nvidia" "displaylink" "modesetting" ];
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
  environment.variables = {
    NIXOS_OZONE_WL = "1";
    PATH = [ "\${HOME}/.local/bin" ];
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_BROKEN = "1";
  };

  # System packages
  environment.systemPackages = with pkgs; [
    displaylink
    libevdev
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
    docker
    docker-buildx
    nvidia-docker
    zoomPkgs.zoom-us
    usbutils
    librealsense
  ];

  boot = {
    extraModulePackages = [ config.boot.kernelPackages.evdi ];
    initrd = {
      # List of modules that are always loaded by the initrd.
      kernelModules = [ "evdi" ];
    };
  };

  systemd.services.dlm.wantedBy = [ "multi-user.target" ];

  # UDEV
  services.udev.packages = [ pkgs.librealsense ];

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

  programs.appimage = {
    enable = true; # provides appimage-run
    binfmt = true; # register AppImages with binfmt_misc
  };

  programs.nix-ld.enable = true;

  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.docker.enable = true;

  # Users
  programs.zsh.enable = true;
  nix.settings.trusted-users = [ "root" "admin" ];
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ "wheel" "docker" "plugdev" "video" ];
    shell = pkgs.zsh;
  };

  # Autologin
  systemd.services."getty@tty1" = {
    overrideStrategy = "asDropin";
    serviceConfig.ExecStart = [
      ""
      "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${config.services.getty.loginProgram} --autologin admin --noclear --keep-baud %I 115200,38400,9600 $TERM"
    ];
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
  system.stateVersion = "25.11";

  #Flakes
  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
