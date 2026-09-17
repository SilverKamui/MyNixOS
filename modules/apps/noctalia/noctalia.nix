{ self, inputs, ... }: {

    flake.wrappersModules.noctalia = { config, lib, ...}: {
        config."config.toml" = ./noctalia-config.toml;
    };

    flake.nixosModules.noctalia = { config, pkgs, ... }: {  
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
        ]; 
    };

    perSystem = { pkgs, ...}: { 
        packages.noctalia = 
            (inputs.wrappers.wrapperModules.noctalia.apply {
                inherit pkgs;
                imports = [self.wrappersModules.noctalia];
                }).wrapper;
    };
}
