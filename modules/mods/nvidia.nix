{ inputs, ... }: {
    flake.nixosModules.nvidia = {
        inputs.nixos-ddcci-nvidia.ddci.enable = true;
    }
}
