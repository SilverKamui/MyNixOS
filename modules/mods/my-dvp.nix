{self, inputs, ...}: {
  flake.nixosModules.myDvp = { config, lib, pkgs, modulesPath, ... }: let
      buildLayout = {
        name,
        description,
        lang,
        symbols,
      }: let
        xkbcomp = lib.getExe pkgs.xorg.xkbcomp;
        compilationOutputFile = pkgs.runCommand "${name}-compiled-keyboard-layout" {} ''
          (${xkbcomp} ${symbols} 2> $out) || true
        '';
        compilationOutput = builtins.readFile compilationOutputFile;
        compilationSuccess = compilationOutput == "";
        errorMessage = "Failure compiling layout [${name}]: ${compilationOutput}";
        ifCompilationSuccess = lib.throwIfNot compilationSuccess errorMessage;
      in {
        ${name} = ifCompilationSuccess {
          description = description;
          languages = [lang];
          symbolsFile = symbols;
        };
      };
    in {
      services.xserver.xkb.extraLayouts = buildLayout {
        name = "my-dvp";
        description = "programmer dvorak with ordered numbers";
        lang = "eng";
        symbols = ./my-dvp.xkb;
      };
    }
}
