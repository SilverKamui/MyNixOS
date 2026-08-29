{ inputs, ... }: {
    flake.nixosModules.vesktop = { inputs, config, ... }: {
        programs.vesktop.enable = true;
    };
}
