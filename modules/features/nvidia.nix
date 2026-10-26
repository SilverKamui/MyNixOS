{ inputs, ... }: {
    flake.nixosModules.nvidia = { config, inputs, pkgs, self, lib, ... }: {
        services.xserver.videoDrivers = ["nvidia"];

        powerManagement.enable = true;
        hardware.nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            powerManagement.finegrained = true;
            open = true;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
        };

        boot.kernelPackages = pkgs.linuxPackages_latest;
        boot.kernelParams = [
            "nvidia-drm.modeset=1"
            "nvidia-drm.fbdev=1"
            "NVreg_UseKernelSuspendNotifiers=1"
            "nvidia.NVreg_TemporaryFilePath=/var/tmp"
        ];

        hardware.nvidia.prime = {
            offload.enable = true;

            nvidiaBusId = "PCI:1@0:0:0";
            amdgpuBusId = "PCI:101@0:0:0";
        };

#        systemd.user.services.hyprland-suspend = {
#            enable = true;
#            description = "suspend hyprland";
#            before = [
#                "systemd-suspend.service"
#                "systemd-hibernate.service"
#                "nvidia-suspend.service"
#                "nvidia-hibernate.service"
#            ];
#            wantedBy = [
#                "systemd-suspend.service"
#                "systemd-hibernate.service"
#            ];
#            
#            serviceConfig = {
#                Type = "oneshot";
#                ExecStart = "/home/kamui/nixos/modules/features/suspend-hyprland.sh";
#            };
#        };

    };
}
