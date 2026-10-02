{ inputs, ... }: {
    flake.nixosModules.audio = { inputs, pkgs, ... }: {
        environment.systemPackages = [
            pwvucontrol
        ];

        software.pulseaudio.enable = false;

        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
    };
}
