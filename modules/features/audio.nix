{ inputs, ... }: {
    flake.nixosModules.audio = { inputs, pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            pwvucontrol
            coppwr
            easyeffects
            hyprpwcenter
        ];

        services.pulseaudio.enable = false;

        services.pipewire = {
            audio.enable = true;
            pulse.enable = true;
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
        };
    };
}
