{ inputs, ... }: {
    flake.nixosModules.commonApps = { pkgs, ... }: {

        nixpkgs.config.permittedInsecurePackages = [
            "electron-39.8.10"
        ];

        environment.systemPackages = with pkgs; [
            # Utility
            udisks
            killall
            nix-index
            
            # Misc
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
            ristretto
            xdg-utils
            #brave

            ## Music
            rmpc
            mpd
            yt-dlp
            ytmdl

            ## Study
            anki
            syncthing
            calibre-no-speech #build-failure #fix
            logseq
        ];
    };
}
