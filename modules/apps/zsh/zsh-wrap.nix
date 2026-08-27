{ self, inputs, ... }: {

    flake.wrappersModules.zsh = { config, lib, ... }: {
        config.settings = {
            shellAliases = {
                v = "nvim";
            };
            
            integrations = {
                fzf.enable = true;
            };

            completion.enable = true;
            completion.fuzzySearch = true;
        };
    };

    flake.nixosModules.zshWrap = { config, pkgs, ... }: {
        programs.zsh.enable = true;
        users.defaultUserShell = self.packages.${pkgs.stdenv.hostPlatform.system}.myZsh;
    };

    perSystem = { pkgs, ...}: {
            packages.myZsh =
                (inputs.wrappers.wrapperModules.zsh.apply {
                    inherit pkgs;
                    imports = [self.wrappersModules.zsh];
                    }).wrapper;
    };
}
