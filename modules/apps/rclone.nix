{ inputs, ... }: {
    flake.nixosModules.rclone = { inputs, pkgs, ... }: {
        environment.systemPackages = [ pkgs.rclone ];
    };

}
