{ inputs, ... }: {

    flake.wrappersModules.zsh = { ..., }: {
        config = {
            settings = {
                shellAliases = {
                    v = neovim;
                };
            };
        };
    };

    flake.nixosModules.zshWrap = { inputs, pkgs, ... }: {
        programs.zsh.enable = true;
        users.defaultUserShell = packages.zsh;

        perSystem = {pkgs, ...}: {
            packages.zsh =
                (inputs.wrappers.wrapperModules.zsh.apply {
                    inherit pkgs;
                    imports = [self.wrappersModules.zsh];
                    }).wrapper;
        };
    };
}
