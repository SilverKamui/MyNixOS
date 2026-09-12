{ self, inputs, ... }: { 

    flake.nixosModules.noctalia = { config, pkgs, ... }: {
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
        ];

        services.upower.enable = true;
    };

    perSystem = { pkgs, ...}: {
        packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
            inherit pkgs;
            settings = 
                (builtins.fromJSON
                    (builtins.readFile ./noctalia.json)).settings;
        };
    };
}
