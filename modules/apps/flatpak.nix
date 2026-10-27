{ inputs, ... }: {
    flake.nixosModules.flatpak = { inputs, ... }: {
        let
        # Fetch nix-flatpak
            nix-flatpak = pkgs.fetchFromGitHub {
                owner = "gmodena";
                repo = "nix-flatpak";
                rev = "v0.8.0";
                hash = "sha256-7ZCulYUD9RmJIDULTRkGLSW1faMpDlPKcbWJLYHoXcs=";
            };
        in
            imports = [
            # Import the nix-flatpak NixOS module and install applications system wide.
            # HomeManager users should import `${nix-flatpak}/modules/home-manager.nix`
            # where appropriate.
            "${nix-flatpak}/modules/nixos.nix"
            ];
        # ... your config

        # Configure nix-flatpak
        services.flatpak = {
            enable = true;
            packages = [
                ""
            ];
        };
    };
}
