{ inputs, ... }: {
    flake.nixosModules.qt = { inputs, pkgs, ... }: {
        qt = {
            enable = true;
            platformTheme = "kde";
        };
    };
}
