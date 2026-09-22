{ inputs, ... }: {
    flake.nixosModules.games = { inputs, pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            osu-lazer-bin
        ];
    };
}
