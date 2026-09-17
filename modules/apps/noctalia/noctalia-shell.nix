{ self, inputs, ... }: { 

    flake.nixosModules.noctalia-shell = { config, pkgs, ... }: {
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia-shell
        ];

        services.upower.enable = true;
    };

    perSystem = { pkgs, ...}: {
        packages.noctalia-shell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
            inherit pkgs;
            settings = 
                (builtins.fromJSON
                    (builtins.readFile ./noctalia.json)).settings;
        };
    };
}
