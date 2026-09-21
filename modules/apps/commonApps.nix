{ inputs, ... }: {
    flake.nixosModules.commonApps = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            seanime
            mpv
            qbittorrent
            ninja
            kdePackages.dolphin
            bitwarden-cli
            cnijfilter2
            grayjay
            libreoffice
            btop
            kdePackages.okular
            calibre
            ristretto
            xdg-utils
        ];
    };
}
