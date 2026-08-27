{ inputs, self, ... }: {
    flake.nixosModules.zsh = { config, pkgs, ... }: {
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.zsh
            pkgs.fzf
        ];

        users.extraUsers.kamui.shell = self.packages.${pkgs.stdenv.hostPlatform.system}.zsh;
    };

    perSystem = { lib, self', pkgs, ...}: {
        packages.zsh = inputs.wrapper-modules.wrappers.zsh.wrap {
            inherit pkgs;
            zshAliases = {
                v = "nvim";
            };
            runtimePkgs = [ pkgs.fzf ];
            zshrc.content = ''
source ${./zdotdir/.zshrc}

eval "$(${lib.getExe self'.packages.starship} init zsh)"
            '';
        };

        packages.starship = inputs.wrapper-modules.wrappers.starship.wrap {
            inherit pkgs;
        };
    };

}

