{ self, inputs, ...}: {

  flake.nixosConfigurations.KamuiGaming = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.KamuiGamingConfiguration
      self.nixosModules.nvidia

      ### Keyboard
      self.nixosModules.myDvp
      self.nixosModules.keyd
 
      ### Desktop
      self.nixosModules.kitty
      self.nixosModules.noctalia
      self.nixosModules.neovim
      self.nixosModules.zenBrowser

      #Gaming
      self.nixosModules.steam
    ];
  };
}
