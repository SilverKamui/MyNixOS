{ inputs, ... }: {
    flake.nixosModules.latex = { pkgs, ... }: {
        environment.systemPackages = [
            inputs.libtexprintf.packages.${pkgs.stdenv.hostPlatform.system}.default
            pkgs.texliveMedium
            pkgs.python314Packages.pylatexenc
        ];
    };
}
