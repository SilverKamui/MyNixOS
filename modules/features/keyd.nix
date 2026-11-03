{ inputs, ... }: {
    flake.nixosModules.keyd = { config, pkgs, ... }: {
        services.keyd = {
            enable = true;
            keyboards = {
                default = {
                    ids = [ "*" ];
                    settings = {
                        main = {
                            capslock = "overload(control, esc)";
                            control = "overload(control, capslock)";
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

        environment.systemPackages = [
            pkgs.keyd
        ];
    };
        }
