{ inputs, ... }: {
    flake.nixosModules.haskell = { inputs, pkgs ... }: {
        environment.systemPackages = with pkgs; [
            ghc
        ];
    };
}
