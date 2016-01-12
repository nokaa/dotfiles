# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  virtualisation.virtualbox.guest.enable = true;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.checkJournalingFS = false;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "colemak/en-latin9";
    defaultLocale = "en_US.UTF-8";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    docker
    gitFull
    oraclejdk8
    scala
    #neovim
    rxvt_unicode
    htop
    wget
    firefox
    tmux
    alsaLib alsaPlugins alsaUtils
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  virtualisation.docker.enable = true;
  programs.zsh.enable = true;

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      inconsolata
      terminus_font
      source-code-pro
      dosemu_fonts
    ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.xserver = {
    enable = true;
    autorun = true;
    xkbVariant = "colemak";
    #defaultDepth = 24;
    #videoDriver = "intel";
    #exportConfiguration = true;
    #resolutions = [{x = 1280; y = 800;}];
    desktopManager.default = "none";
    windowManager = {
      default = "awesome";
      awesome.enable = true;
    };
    displayManager.slim = {
      enable = true;
    };
  };

  time.timeZone = "America/Chicago";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.nokaa = {
    name = "nokaa";
    password = "cock";
    group = "users";
    uid = 1000;
    extraGroups = [ "wheel" ];
    createHome = true;
    home = "/home/nokaa";
    shell = "/run/current-system/sw/bin/zsh";
  };
}
