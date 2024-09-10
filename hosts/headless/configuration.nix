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
  addBluetooth.enable = false;
  addSound.enable = false;


  programs.zsh.enable = true;


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
  users.users.joachimos = {
    isNormalUser = true;
    description = "Joachim Olsen Storli";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim 
    brightnessctl
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
}
