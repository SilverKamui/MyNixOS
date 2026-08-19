{ inputs, ... }: {
    flake.nixosModules.keyd = { config, ... }: {
        services.keyd = {
            enable = true;
            keyboards = {
                default = {
                    ids = [ "*" ];
                    settings = {
                        main = {
                            capslock = "overload(control, esc)";
                        };
                            otherlayer = {};
                    };
                };
            };
        };

        environment.etc."libinput/local-overrides.quirks".text = ''
            [Serial Keyboards]
            MatchUdevType=keyboard
                MatchName=keyd virtual keyboard
                AttrKeyboardIntegration=internal
        '';
    };
}
