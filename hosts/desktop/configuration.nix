{ inputs, config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Disabling or enabling my own modules  
  useHyprland.enable = false;
  devPackages.enable = true;
  generalPackages.enable = true; 
  sshPort22.enable = false;
  useKDEPlasma.enable = true;
  addDistrobox.enable = true;
  addSound.enable = true;


  programs.zsh.enable = true;

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    }; 
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us, no";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joachims = {
    isNormalUser = true;
    description = "Joachim Storli";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim 
    inputs.my-nixvim.packages.${system}.default
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome_5
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
