{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ 
    "nix-command" "flakes" 
  ];

  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Argentina/Buenos_Aires";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  # services.xserver.libinput.enable = true;

  users.users.dante = {
    isNormalUser = true;
    description = "dante";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [];
    shell = pkgs.fish;
  };

  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.vim = {
    enable = true;
    package = pkgs.vimHugeX;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    chromium
    helix
    ghostty
    fish
    git
    emote
    vlc
    obs-studio
    dbeaver-bin
    tree
    calibre
    htop
    jq
    nodejs_23
    prettierd
    # sway
    # typescript-language-server
    # vscode-langservers-extracted
    # vimPlugins.vim-plug
    # vimPlugins.vim-lsp
    # vimPlugins.vim-prettier
    # vimPlugins.vim-lsp-settings
  ];

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  system.stateVersion = "24.11";
}
