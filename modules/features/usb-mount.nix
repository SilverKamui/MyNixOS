{ inputs, ... }: {
    flake.nixosModules.usbMount = { inputs, ... }: {
        services.devmon.enable = true;
        services.gvfs.enable = true; 
        services.udisks2.enable = true;
    };
}
