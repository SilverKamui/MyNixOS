{ inputs, ... }: {
    flake.nixosModules.networkManager = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            networkManager
        ];
    };
}
