{ inputs, ... }: {
    flake.nixosModules.zshSimple = { inputs, pkgs, ... }: {
        programs.zsh.enable = true;
        users.defaultUserShell = pkgs.zsh;
    };
}
