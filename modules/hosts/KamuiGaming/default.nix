{ self, inputs, ...}: {

  flake.nixosConfigurations.KamuiGaming = inputs.nixpkgs.lib.nixosSystem {
    modules = [];
  };
}
