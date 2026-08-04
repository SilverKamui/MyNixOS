{
  self,
  inputs,
  ...
}: {
  flake.wrappersModules.kitty = {
    config,
    lib,
    ...
  }: {
    options.shell = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    config = {
      args = lib.mkAfter (lib.optionals (config.shell != "") [config.shell]);
      settings = {
            enable_audio_bell = "no";

            font_size = 14;
            font_family = "Fira Code Regular Nerd Font Complete Mono";
            bold_font = "auto";
            italic_font = "auto";
            
            background_opacity = "0.95";
      };
    };
  };

  perSystem = {pkgs, ...}: {
    packages.kitty =
      (inputs.wrappers.wrapperModules.kitty.apply {
        inherit pkgs;
        imports = [self.wrappersModules.kitty];
      }).wrapper;
  };
}
