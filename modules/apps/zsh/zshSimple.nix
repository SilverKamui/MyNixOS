{ inputs, ... }: {
    flake.nixosModules.zshSimple = {
        programs.zsh.enable = true;
        users.defaultUserShell = pkgs.zsh;
    };
}
