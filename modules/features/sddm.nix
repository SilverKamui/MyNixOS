{ inputs, ... }: {
    flake.nixosModules.sddm = { inputs, pkgs, ... }:
        let
          sddm-astronaut = (pkgs.sddm-astronaut.override {
            embeddedTheme = "japanese_aesthetic";  # or any other theme
            themeConfig = {

                #################### General ####################

                ScreenPadding="";
                # Default 0, Options: from 0 to min(screen width/2,screen height/2). 

                Font="Open Sans";
                FontSize="";
                # Default is screen height divided by 80 (1080/80=13.5), Options: 0-inf.

                KeyboardSize="0.4";
                #  Default 0.4, Options 0.1-1.0

                RoundCorners="20";

                Locale="";
                # Locale for data and time format. I suggest leaving it blank.
                HourFormat="HH:mm";
                # Default Locale.ShortFormat.
                DateFormat="dddd d MMMM";
                # Default Locale.LongFormat.

                HeaderText="";
                # You can put somehting fun.
                HeaderTextColor = "#f96ba9";

              # Customize colors and settings
              #################### Colors ####################

                HighlightColor="#f96ba9";
                # Main color.
                BackgroundColor="#dce0e8";
                # Background color.
                # Connected with: HaveFormBackground
                TextColor="#353535";
                PlaceholderColor="#353535";
                # Placholder text color (username, password).
                SystemButtonsIconColor="#353535";
                # System icon colors.

                HighlightTextColor="#f96ba9";
                # Overrides HighlightColor.
                LoginButtonTextColor="";
                # Overrides TextColor.
                LoginButtonBackgroundColor="";
                # Overrides HighlightColor.
                BackgroundListColor="";
                # Overrides BackgroundColor.
                HoverSessionAndVirtualKeyboard="#ffadd1";
                # Overrides HighlightColor.

                #################### Background ####################

                Background="Backgrounds/kuromi-latte.png";
                # Must be relative path.
                DimBackground="0.0";
                # Options: 0.0-1.0.
                CropBackground="true";
                # Default false.
                # Crop or fit background.
                # Connected with: BackgroundHorizontalAlignment and BackgroundVerticalAlignment dosn't work when set to true.
                BackgroundHorizontalAlignment="center";
                # Default: center, Options: left, center, right.
                # Horizontal position of the background picture.
                # Connected with: CropBackground must be set to false.
                BackgroundVerticalAlignment="center";
                # Horizontal position of the background picture.
                # Default: center, Options: bottom, center, top.
                # Connected with: CropBackground must be set to false.

                #################### Form ####################

                PartialBlur="false";
                # Default false.
                FullBlur="";
                # Default false.
                # If you use FullBlur I recommend setting BlurMax to 64 and Blur to 1.0.
                BlurMax="";
                # Default 48, Options: 2-64 (can go higher because depends on Blur).
                # Connected with: Blur.
                Blur="";
                # Default 2.0, Options: 0.0-3.0 (without 3.0).
                # Connected with: BlurMax.

                HaveFormBackground="false";
                # Form background is transparent if set to false.
                # Connected with: PartialBlur and BackgroundColor.
                FormPosition="center";
                # Default: left, Options: left, center, right.

              # ... other theme configuration options
            };
          }).overrideAttrs (oldAttrs: {
            # Optional: Inject custom background image
            installPhase = oldAttrs.installPhase + ''
              chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
              cp ${./kuromi-latte.png} \
                $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/kuromi-latte.png
            '';
          });
        in
        {
          environment.systemPackages = [ sddm-astronaut ];
          
          services.displayManager.sddm = {
            enable = true;
            wayland.enable = true;
            package = pkgs.kdePackages.sddm;
            extraPackages = with pkgs; [
              kdePackages.qtmultimedia # Required for video backgrounds/audio
            ];
            theme = "sddm-astronaut-theme";
          };
          
          services.displayManager.defaultSession = "hyprland";
        };
}
