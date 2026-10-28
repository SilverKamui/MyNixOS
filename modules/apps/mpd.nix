{ inputs, ... }: {
    flake.nixosModules.mpd = { inputs, pkgs ... }: {
        services.mpd = {
            enable = true;
            music_directory = "~/Music";
            playlist_directory = "~/Music/MpdPlaylists"
            extraConfig = ''
            audio_output {
                type		"pipewire"
                name		"pipewire"
                device		"hw:0,0"	# optional
                mixer_type      "hardware"	# optional
                mixer_device	"default"	# optional
                mixer_control	"PCM"		# optional
                mixer_index	"0"		# optional
            }
            input {
                plugin "curl"
        #       proxy "proxy.isp.com:8080"
        #       proxy_user "user"
        #       proxy_password "password"
        }
            '';
        };
    };
}
