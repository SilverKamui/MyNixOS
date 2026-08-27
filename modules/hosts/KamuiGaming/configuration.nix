{self, inputs, ...}: {
  flake.nixosModules.KamuiGamingConfiguration = { config, pkgs, ... }: {
      imports =
        [ # Include the results of the hardware scan.
          self.nixosModules.KamuiGamingHardware
        ];
      
      nix.settings.experimental-features = [ "nix-command" "flakes" ];

      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "KamuiGaming"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # Configure network proxy if necessary
      # networking.proxy.default = "http://user:password@proxy:port/";
      # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

      # Enable networking
      networking.networkmanager.enable = true;

      # Set your time zone.
      time.timeZone = "Europe/London";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_GB.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
      };

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "gb";
        variant = "";
      };  

      #services.xserver.xkb.extraLayouts = {
      #my-dvp = {
      #  description = "my-dvp";
      #  languages = ["eng"];
      #  symbolsFile = ./my-dvp.xkb;
      #  };
      #};

      # Configure console keymap
      console.keyMap = "uk";

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.kamui = {
        isNormalUser = true;
        description = "Ammar Tourabi";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
      };

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      #  wget
      lshw
      nvitop
      pciutils
      kitty
      git
      librewolf
      wl-clipboard
      yazi
      brightnessctl
      ];
      # OpenGL
      hardware.graphics = {
        enable = true;
      };

      fonts.packages = with pkgs; [
          fira-code
          fira-code-symbols
          fira-sans
          nerd-fonts.jetbrains-mono
      ];


      # Nvidia 
#      boot.kernelPackages = pkgs.linuxPackages_latest;
#      boot.kernelParams = [
#          "nvidia-drm.modeset=1"
#              "nvidia-drm.fbdev=1"
#      ];
      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };

      # List services that you want to enable:

      # Enable the OpenSSH daemon.
      # services.openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.05"; # Did you read the comment?

    };
}
