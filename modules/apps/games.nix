{ inputs, ... }: {
    flake.nixosModules.games = { inputs, ... }: {
        environment.systemPackages = with pkgs; [
            osu-lazer-bin
        ];
    };
}
