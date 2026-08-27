{ self, inputs, ... }: {

    flake.wrappersModules.zsh = { config, lib, ... }: {
        config.settings = {
            shellAliases = {
                v = "nvim";
                nrs = "cd ~/nixos && sudo nixos-rebuild switch --flake .#KamuiGaming";
            };
            
            integrations = {
                fzf.enable = true;
                oh-my-posh.enable = true;
            };

            completion.enable = false;
            completion.fuzzySearch = true;
        };
    };

    flake.nixosModules.zshWrap = { config, pkgs, ... }: {
        programs.zsh.enable = true;
        users.extraUsers.kamui.shell = self.packages.${pkgs.stdenv.hostPlatform.system}.myZsh;
    };

    perSystem = { pkgs, ...}: {
            packages.myZsh =
                (inputs.wrappers.wrapperModules.zsh.apply {
                    inherit pkgs;
                    imports = [self.wrappersModules.zsh];
                    }).wrapper;
    };
}
