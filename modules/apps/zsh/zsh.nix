{ inputs, ... }: {
    flake.nixosModules.zsh = { inputs, pkgs, ... }: {
        programs.zsh.enable = true;
        users.extraUsers.kamui = {
            shell = pkgs.zsh;
        };
    };
}
