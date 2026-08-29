{ inputs, self, ... }: {
    flake.nixosModules.zsh = { config, pkgs, ... }: {
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.zsh
            pkgs.fzf
        ];

        users.extraUsers.kamui.shell = self.packages.${pkgs.stdenv.hostPlatform.system}.zsh;

        programs.zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestions.enable = true;  
            syntaxHighlighting.enable = true;
            
            histSize = 10000;
            histFile = "$HOME/.zsh_history";  
            setOptions = [
                "HIST_IGNORE_ALL_DUPS"
            ];

            ohMyZsh = {
                enable = true;
                plugins = [
                    "git"
                    "zsh-yazi-mount"
                ];
                theme = "robbyrussell";
            };
        };
    };

    perSystem = { lib, self', pkgs, ...}: {
        packages.zsh = inputs.wrapper-modules.wrappers.zsh.wrap {
            inherit pkgs;
            zshAliases = {
                v = "nvim";
                nrs = "cd ~/nixos && sudo nixos-rebuild switch --flake .#KamuiGaming";
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

