# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
#  overlays = [ (import ./overlays/nur.nix) ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  #boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "loglevel=3" "rd.systemd.show_status=auto" "rd.udev.log_priority=3" ];
  boot.kernel.sysctl = {
    "kernel.sysrq" = 1;
    "kernel.printk" = "3 3 3 3";
     };

  networking.hostName = "oh-my-nix"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  


  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  #networking.interfaces.enp2s0.useDHCP = true;
  #networking.interfaces.wlp3s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  
  time.timeZone = "Asia/Yekaterinburg";
  
  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    supportedLocales = [ "ru_RU.UTF-8/UTF-8" ];
  };
  
  console = {
    packages = with pkgs; [ terminus_font ];
    font = "ter-v16n";
    keyMap = "ru";
    earlySetup = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
  git
  neofetch
  pciutils
  papirus-icon-theme
  yakuake
  lm_sensors
  vlc
  nfs-utils
  ntfs3g
  krita
  wget
  iptables
  filezilla
  youtube-dl
  qbittorrent
  p7zip
  unzip
  zip
  unrar
  htop
  mc
  samba
  chromium
  lutris
  wine-staging
  mpv
  latte-dock
  teamviewer
  libreoffice-still
  flatpak
  terminus_font_ttf
  fira
  fira-code
  materia-theme
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.resolved.enable = true;
  services.resolved.dnssec = "false";
  services.avahi.enable = true;
  services.samba.enable = true;
  services.teamviewer.enable = true;
  services.flatpak.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.dpi = 102;  
  services.xserver.layout = "us,ru";
  #services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;
  
  hardware.bluetooth.enable = true;
  hardware.usbWwan.enable = true;

 # hardware.opengl.enable = true;
 # hardware.opengl.s3tcSupport = true;
 # hardware.opengl.useIrisDriver = true;

 # hardware.opengl.extraPackages = with pkgs; [
 #   intel-media-driver
 # ];
  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.stez = {
     description = "Aleksandr";
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     uid = 1000;
     password = "123";
     isNormalUser = true;
   };

   users.users.root = {
    password = "123";
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

