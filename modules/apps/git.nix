{ inputs, ... }: {
    flake.nixosModules.git = { config, pkgs, ... }: {

        environment.systemPackages = [
            pkgs.git
        ];
        programs.ssh.startAgent = true;

        services.openssh = {
            enable = true;
            settings = {
                PasswordAuthentication = false;
                KbdInteractiveAuthentication = false;
                PermitRootLogin = "no";
                AllowUsers = [ "kamui" ];
                MaxAuthTries = 3;
                PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
            };
        };
    };
}
