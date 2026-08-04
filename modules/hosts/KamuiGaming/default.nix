{ self, inputs, ...}: {

  flake.nixosConfigurations.KamuiGaming = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.KamuiGamingConfiguration
      self.nixosModules.myDvp
    ];
  };
}
