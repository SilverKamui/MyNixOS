{ inputs, ... }: {
    flake.nixosModules.commonApps = { pkgs, ... }: {
        environment.systemPackages = with pkgs [
            seanime
        ];
    };
}
