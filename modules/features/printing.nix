{ inputs, ... }: {
    flake.nixosModules.print = { inputs, ... }: {
        services.printing.enable = true;
        drivers = with pkgs; [
            cups-filters
                cups-browsed
        ];

    };
}
