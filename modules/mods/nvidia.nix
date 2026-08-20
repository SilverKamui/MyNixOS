{ inputs, ... }: {
    flake.nixosModules.nvidia = { config, inputs, ... }: {
        hardware.ddcci.enable  = true;
    };
}
