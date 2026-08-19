{ inputs, ... }: {
    flake.nixosModules.zenBrowser = {inputs, pkgs, ... }: {
        environment.systemPackages = [
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
    };
}
