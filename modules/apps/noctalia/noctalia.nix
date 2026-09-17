{ self, inputs, ... }: {

    flake.wrapperModules.noctalia = { config, lib, ...}: {
        config.settings = {
            
        };
    };

    flake.nixosModules.noctalia = { inputs, pkgs, self, ... }: {  
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
        ]; 
    };

    perSystem = { self, pkgs, ...}: {
        packages.noctalia = 
            (inputs.wrappers.wrapperModules.noctalia.apply {
                inherit pkgs;
                }).wrapper;
    };
}
