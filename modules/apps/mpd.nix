{ inputs, ... }: {
    flake.nixosModules.mpd = { inputs, ... }: {
        services.mpd = {
            enable = true;
            settings.music_directory = /home/kamui/Music;
            settings.playlist_directory= /home/kamui/Music;
            settings = {
                audio_output = [
                    {
                        type = "alsa";
                        name = "MY ALSA";
                        device = "hw:0,0";	# optional
                        mixer_type = "hardware";	# optional
                        mixer_device = "default";	# optional
                        mixer_control = "PCM";		# optional
                        mixer_index	= "0";		# optional
                    }
                ];
                
                input = [
                {
                    plugin = "curl";
       #       proxy "proxy.isp.com:8080"
       #       proxy_user "user"
       #       proxy_password "password"
                }
                ];
            };
        };
    };
}
