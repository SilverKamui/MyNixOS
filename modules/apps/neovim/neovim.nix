{ inputs, ... }: { 
    flake.nixosModules.neovim = {pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            neovim
            ripgrep
            lazygit
            python3
            luarocks
            luaPackages.tree-sitter-cli
        ];
    };
}
