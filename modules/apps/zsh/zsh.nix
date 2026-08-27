{ inputs, self, ... }: {
  flake.nixosModules.zsh = { config, pkgs, ... }: {
        environment.systemPackages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.zsh
        ];
    };

    perSystem = { pkgs, ...}: {
        packages.zsh = inputs.wrapper-modules.wrappers.zsh.wrap {
            inherit pkgs;
            zshAliases = {
                v = "nvim";
            };
        };
    };

}

