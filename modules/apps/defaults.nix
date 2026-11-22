{ inputs, ... }: {
    flake.nixosModules.defaults = { inputs, ... }: {
        xdg.mimeApps = {
            enable = true;
            defaultApplications = {
                "inode/directory" = [ "dolphin.desktop" ];
                "application/x-gnome-saved-search" = [ "dolphin.desktop" ];
            };
        };
    };
}
