{ inputs, ... }: {
    flake.nixosModule.bluetooth = { config, ... }: {
        hardware.bluetooth.enable = true;
    };
}
