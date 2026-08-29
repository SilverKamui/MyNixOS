{ inputs, ... }: {
    flake.nixosModules.bluetooth = { config, ... }: {
        hardware.bluetooth.enable = true;
    };
}
