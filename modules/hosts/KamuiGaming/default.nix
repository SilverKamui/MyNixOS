{ self, inputs, ...}: {

  flake.nixosConfigurations.KamuiGaming = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.KamuiGamingConfiguration
      self.nixosModules.nvidia

      ### Keyboard
      self.nixosModules.myDvp
      self.nixosModules.keyd

      ### Shell
      self.nixosModules.kitty
      self.nixosModules.git
      self.nixosModules.zsh
 
      ### Desktop
      self.nixosModules.noctalia
      self.nixosModules.neovim
      self.nixosModules.zenBrowser

      #Gaming
      self.nixosModules.steam
    ];
  };
}
