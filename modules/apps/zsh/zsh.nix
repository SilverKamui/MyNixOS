{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.zsh = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {
    nixpkgs.overlays = [
      (final: prev: {
        zsh = self'.packages.zsh;
      })
    ];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histSize = 10000;

      ohMyZsh = { # "ohMyZsh" without Home Manager
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
      };

    };
    users.extraUsers.kamui.shell = pkgs.zsh;
  });
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages = {
      zsh = let
        flakeLocation = builtins.getEnv "PWD";
      in
        lib.warnIf (flakeLocation == "") "Flake Location is ${flakeLocation}. Are you building in the right directory?"
        inputs.wrapper-modules.wrappers.zsh.wrap {
          inherit pkgs;
          runtimePkgs = [pkgs.carapace pkgs.devenv pkgs.fzf];
          zshAliases = {
            ls = "${lib.getExe pkgs.lsd} -l";
            v = lib.getExe pkgs.neovim;
            cat = lib.getExe pkgs.bat;
            lg = lib.getExe pkgs.lazygit;
            nsh = "nix-shell -p";
            nrs =
            if flakeLocation != ""
              then "( cd ${flakeLocation}/nixos && sudo nixos-rebuild switch --flake . )"
              else "echo 'Flake location not specified. Did you build with --impure?'";
          };
          zshrc.content = ''
                  	source <(${lib.getExe pkgs.fzf} --zsh)

                  	eval "$(${lib.getExe self'.packages.ohMyPosh} init zsh)"

                    ##########################################################
                    ###     Functions
                    ##########################################################
                    function y() {
                        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
                        yazi "$@" --cwd-file="$tmp"
                        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                                builtin cd -- "$cwd"
                        fi
                        rm -f -- "$tmp"
                    }



          '';
        };
      ohMyPosh = inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
        inherit pkgs;
      };
    };
  };
}

