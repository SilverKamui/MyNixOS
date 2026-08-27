{ self, inputs, ... }: {

    flake.wrappersModules.zsh = { config, ... }: {
        config = {
            settings = {
                shellAliases = {
                    v = "neovim";
                };
            };
        };
    };

    flake.nixosModules.zshWrap = { self, inputs, pkgs, ... }: {
        programs.zsh.enable = true;
        users.defaultUserShell = pkgs.zsh;
    };

    perSystem = { inputs, self, pkgs, ...}: {
            packages.zsh =
                (inputs.wrappers.wrapperModules.zsh.apply {
                    inherit pkgs;
                    imports = [self.wrappersModules.zsh];
                    }).wrapper;
    };
}
