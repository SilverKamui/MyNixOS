{ inputs, ... }: {
    flake.nixosModules.commonApps = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            seanime
            mpv
            qbittorrent
            ninja
            kdePackages.dolphin
        ];
    };
}
