{ inputs, ... }: {
    flake.nixosModules.git = { config, pkgs, ... }: {
        
        environment.systemPackages = [
            pkgs.git
        ];
        programs.ssh.startAgent = true;
    };
}
