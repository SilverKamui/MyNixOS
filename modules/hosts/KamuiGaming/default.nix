{ self, inputs, ...}: {

  flake.nixosConfigurations.KamuiGaming = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.KamuiGamingConfiguration
      self.nixosModules.myDvp
      ### Desktop
      self.nixosModules.kitty
      self.nixosModules.noctalia
      self.nixosModules.test
    ];
  };
}
