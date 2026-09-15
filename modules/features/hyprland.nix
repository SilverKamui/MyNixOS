{ inputs, ... }: {
    flake.nixosModules.hyprland = { inputs, pkgs, ... }: {
        programs.hyprland = {
            enable = true;
            xwayland.enable = true;
            withUWSM = true;
        };

        environment.systemPackages = with pkgs; [
            hyprlock
            hypridle
        ];
    };
}
