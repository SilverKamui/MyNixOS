{ inputs, ... }: {
    flake.nixosModules.zsh = {
        programs.zsh.enable = true;
        users.extraUsers.kamui = {
            ...
                shell = pkgs.zsh;
        };
    }
}
