{ inputs, ... }: {

    flake.wrapperModules.noctalia = { config, lib, ...}: {
        config.settings = {
            
        };
    };

    flake.nixosModules.noctalia-shell = { inputs, pkgs, self, ... }: {  
    
    };

    perSystem = { pkgs, ...}: {
        packages.noctalia = 
            (inputs.wrappers.wrapperModules.noctalia.apply {
                inherit pkgs;
                imports = [self.wrapperModules.noctalia];
                }).wrapper;
    };
}
