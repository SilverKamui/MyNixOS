{ inputs, ... }: { 
    flake.nixosModules.neovim = {pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            neovim
            nodejs_26
            ripgrep
            lazygit
            python3
            luarocks
            stylua
            luaPackages.tree-sitter-cli

            # Tree sitter
            python314Packages.tree-sitter-grammars.tree-sitter-latex
            python314Packages.tree-sitter-grammars.tree-sitter-html
            python314Packages.tree-sitter-grammars.tree-sitter-yaml

            # markdown
            python314Packages.pylatexenc
            marksman
            
            #haskell
            haskell-language-server

            #lua
            lua-language-server

            #rust nvim
            lldb
            tree-sitter-grammars.tree-sitter-rust
            rust-analyzer

            # vimtex
            haskellPackages.bibtex
            biber
            zathura

            # telescope
            fd
        ];
    };
}
