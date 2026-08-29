{ inputs, ... }: {
    flake.nixosModules.nvidia = { config, inputs, ... }: {
        services.xserver.videoDrivers = ["nvidia"];

        hardware.nvidia = {
            modesetting.enable = true;
            powerManagement.enable = false;
            powerManagement.finegrained = false;
            open = true;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
        };

        hardware.nvidia.prime = {
            offload.enable = true;

            nvidiaBusId = "PCI:1@0:0:0";
            amdgpuBusId = "PCI:101@0:0:0";
        };

    };
}
