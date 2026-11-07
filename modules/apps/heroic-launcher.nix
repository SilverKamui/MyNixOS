{ inputs, ... }: {
    flake.nixosModules.heroic = { inputs, pkgs, ... }: {
        programs.gamescope.enable = true;
        programs.gamemode.enable = true;

        environment.systemPackages = with pkgs; [
            (heroic.override {
              extraPkgs = pkgs': with pkgs'; [
                gamescope
                gamemode
              ];
            })
        ];
    };
}
