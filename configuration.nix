{pkgs, ...}: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.hostName = "nixos";

  # Locale
  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  # Menno
  users.users.menno = {
    isNormalUser = true;
    description = "Menno";
    extraGroups = ["networkmanager" "wheel"];
  };

  services.displayManager.gdm.enable = true;
  programs = {
    git = {
      enable = true;
      config.user = {
        name = "Menno Hofste";
        email = "menno1337@gmail.com";
      };
    };
    hyprland.enable = true;
  };

  environment.systemPackages = [pkgs.vim pkgs.kitty];

  # Set experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Only change after reading options
  system.stateVersion = "26.05";
}
