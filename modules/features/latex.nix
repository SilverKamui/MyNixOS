{ inputs, ... }: {
    flake.nixosModules.latex = { inputs, pkgs, ... }: {
        environment.systemPackages = [
            inputs.libtexprintf-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
            texliveMedium
            python314Packages.pylatexenc
        ];
    };
}
