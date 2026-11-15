# Noctalia settings, mirrored from the GUI by the dmopp/settings-to-nix plugin
# (/home/kamui/.local/state/noctalia/settings.toml). Every export overwrites this file.
#
# This file is your backup: keep it somewhere safe, for example in git.
#
# To restore, run this as your user in the directory of this file:
#   $(nix-build --no-out-link ./gui-settings.nix)/bin/noctalia-restore-settings
# It replaces settings.toml (the old one is kept as settings.toml.bak-<time>).
# Then restart Noctalia; it installs the plugins listed here again on startup.
{ pkgs ? import <nixpkgs> { } }:
let
  settings = {
    bar.default = {
      auto_hide = true;
      concave_edge_corners = false;
      end = [
        "media"
        "tray"
        "wallpaper"
        "caffeine"
        "notifications"
        "clipboard"
        "network"
        "bluetooth"
        "volume"
        "brightness"
        "battery"
        "control-center"
        "session"
      ];
      font_scale = 1.1299999821931124;
      margin_ends = 0;
      position = "bottom";
      radius = 0;
      radius_bottom_left = 0;
      radius_bottom_right = 0;
      reserve_space = false;
      start = [ "launcher" "wallpaper" "workspaces" "ram" "temp" "cpu" "weather" ];
      thickness = 40;
      widget_spacing = 8;
    };
    config_version = 16;
    idle = {
      behavior = {
        lock = {
          action = "lock";
          enabled = true;
          timeout = 600.0;
        };
        lock-and-suspend = {
          action = "lock_and_suspend";
          enabled = false;
          timeout = 900.0;
        };
        screen-off = {
          action = "screen_off";
          enabled = true;
          timeout = 660.0;
        };
      };
      behavior_order = [ "lock" "screen-off" "lock-and-suspend" ];
    };
    location.address = "St. Andrews, Fife";
    lockscreen_widgets = {
      enabled = false;
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      schema_version = 2;
      widget."lockscreen-login-box@eDP-1" = {
        box_height = 196.0;
        box_width = 810.0;
        cx = 1280.0;
        cy = 1418.0;
        output = "eDP-1";
        placement_height = 1600.0;
        placement_width = 2560.0;
        rotation = 0.0;
        settings = {
          background_color = "surface_container";
          background_opacity = 0.88;
          background_radius = 12.0;
          center_password_text = false;
          input_opacity = 1.0;
          input_radius = 6.0;
          layout = "regular";
          show_caps_lock = true;
          show_keyboard_layout = true;
          show_login_button = true;
          show_media = true;
          show_password_reveal = true;
          show_session_buttons = true;
          show_unlock_hint = true;
          show_weather = true;
        };
        type = "login_box";
      };
      widget_order = [ "lockscreen-login-box@eDP-1" ];
    };
    plugin_settings."dmopp/settings-to-nix" = {
      panel_placement = "floating";
      panel_position = "center";
      target_path = "/home/kamui/nixos/modules/apps/noctalia/settings-backup/gui-settings.nix";
    };
    plugins.enabled = [ "dmopp/settings-to-nix" ];
    shell.font_family = "Noto Sans CJK JP";
    theme = {
      builtin = "Rosé Pine";
      source = "builtin";
      wallpaper_scheme = "m3-content";
    };
  };
  settingsToml = (pkgs.formats.toml { }).generate "noctalia-settings.toml" settings;
in
(pkgs.writeShellScriptBin "noctalia-restore-settings" ''
  set -eu
  PATH=${pkgs.coreutils}/bin:$PATH
  if [ -n "''${NOCTALIA_STATE_HOME:-}" ]; then
    dir="$NOCTALIA_STATE_HOME/noctalia"
  elif [ -n "''${XDG_STATE_HOME:-}" ]; then
    dir="$XDG_STATE_HOME/noctalia"
  else
    dir="$HOME/.local/state/noctalia"
  fi
  mkdir -p "$dir"
  if [ -e "$dir/settings.toml" ]; then
    backup="$dir/settings.toml.bak-$(date +%Y%m%d-%H%M%S)"
    cp "$dir/settings.toml" "$backup"
    echo "Previous settings saved to $backup"
  fi
  tmp=$(mktemp "$dir/.settings.toml.XXXXXX")
  cat ${settingsToml} > "$tmp"
  chmod 644 "$tmp"
  mv "$tmp" "$dir/settings.toml"
  # Skip the first-run wizard; it would write its own choices over the restored ones.
  touch "$dir/.setup-complete"
  echo "Noctalia settings restored to $dir/settings.toml."
  echo "Restart Noctalia so it installs the plugins from the restored settings."
'') // { inherit settings; }
