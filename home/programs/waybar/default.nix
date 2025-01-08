{ config, lib, pkgs, ... }:

{
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      style = ''
* {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    font-weight: bold;
    font-size: 12px;
}

window#waybar.bar1 {
    background-color: rgba(0,0,0,0.0);
}

#workspaces button {
    padding: 0 16px 0 16px;
    margin: 0 4px 0 0;
    outline: 0;
    color: #ffffff;
    border-radius: 12px;
    background-color: rgba(0,0,0,0.75);
}

#workspaces button.active {
    background-color:rgba(0,0,0,0.75);
    color: #ffa500;
    border: solid 1px orange;
}

#custom-keyboard-icon {
    color:#ffa500;
    font-size: 14px;
    padding: 0 10px 0 8px;
    background-color:rgba(0,0,0,0.75);
}

#language {
    color: #ffffff;
    padding: 0 0 0 0;
    background-color:rgba(0,0,0,0.75);
}

#battery {
    color: #ffffff;
    font-size: 16px;
    padding: 0 16px 0 10px;
    background-color:rgba(0,0,0,0.75);
}

#bluetooth {
    color: #0082FC;
    font-size: 18px;
    padding: 0 8px 0 0px;
    background-color:rgba(0,0,0,0.75);
}

#custom-network {
    color: #ffffff;
    font-size: 19px;
    padding: 0 24px 0 0;
    background-color:rgba(0,0,0,0.75);
    border-top-right-radius: 12px;
    border-bottom-right-radius: 12px;
}

#custom-cpu-icon {
    color: #ffa500;
    font-size: 16px;
    padding: 0 8px 0 16px;
    background-color:rgba(0,0,0,0.75);
    border-top-left-radius: 12px;
    border-bottom-left-radius: 12px;
}

#cpu {
    color: #ffffff;
    padding: 0 10px 0 0;
    background-color:rgba(0,0,0,0.75);
}

#custom-memory-icon {
    color: #ffa500;
    font-size: 14px;
    padding: 0 4px 0 0;
    background-color:rgba(0,0,0,0.75);
}

#memory {
    color: #ffffff;
    padding: 0 0 0 0;
    background-color:rgba(0,0,0,0.75);
}

#custom-clock-icon {
    margin-left: 25px;
    color: #ffa500;
    font-size: 16px;
    padding: 0 10px 0 16px;
    background-color:rgba(0,0,0,0.75);
    border-top-left-radius: 12px;
    border-bottom-left-radius: 12px;
}

#clock {
    color: #ffffff;
    padding: 0 16px 0 0;
    background-color:rgba(0,0,0,0.75);
    border-top-right-radius: 12px;
    border-bottom-right-radius: 12px;
}

#custom-date-icon {
    margin-left: 250px;
    color: #ffa500;
    font-size: 16px;
    padding: 0 10px 0 16px;
    background-color:rgba(0,0,0,0.75);
    border-top-left-radius: 12px;
    border-bottom-left-radius: 12px;
}

#custom-date {
    color: #ffffff;
    padding: 0 16px 0 0;
    background-color:rgba(0,0,0,0.75);
    border-top-right-radius: 12px;
    border-bottom-right-radius: 12px;
}

#custom-power {
    margin-left: 25px;
    color: #ffffff;
    padding: 0px 5px 0 10px;
    background-color:rgba(0,0,0,0.75);
    border-radius: 12px;
}

#custom-audio-icon {
    color:#ffa500;
    padding: 0 8px 0 8px;
    font-size: 14px;
    background-color:rgba(0,0,0,0.75);
}

#wireplumber {
    color: #ffffff;
    padding: 0 0 0 4px;
    background-color:rgba(0,0,0,0.75);
}
      '';
settings =
[
    {
        "mode" = "overlay";
        "fixed-center" = false;
        "name" = "bar1";
        "output" = [
            "eDP-1"
            "DP-1"
            "DP-2"
        ];
        "margin" = "4px 12px 0px 11px";
        "layer" = "bottom";
        "position" = "top";
        "modules-left" = [
            "hyprland/workspaces"
        ];
        "modules-right" = [
            "custom/cpu-icon"
            "cpu"
            "custom/memory-icon"
            "memory"
            "custom/audio-icon"
            "wireplumber"
            "custom/keyboard-icon"
            "hyprland/language"
            "battery"
            "bluetooth"
            "custom/network"
            "custom/date-icon"
            "custom/date"
            "custom/clock-icon"
            "clock"
            "custom/power"
        ];
        "hyprland/workspaces" = {
            "format" = "{icon}";
            "disable-scroll" = true;
        };
        "custom/cpu-icon" = {
            "format" = "";
        };
        "cpu" = {
            "interval" = 5;
            "format" = "{}%";
            "max-length" = 10;
        };
        "custom/memory-icon" = {
            "format" = "";
        };
        "memory" = {
            "interval" = 5;
            "format" = "{}%";
            "max-length" = 10;
        };
        "custom/audio-icon" = {
            "format" = "";
        };
        "wireplumber" = {
            "format" = "{volume}%";
            "on-click" = "pavucontrol";
            "max-volume" = 150;
            "scroll-step" = 0.2;
        };
        "custom/keyboard-icon" = {
            "format" = "";
            "on-click" = "/home/admin/.config/waybar/keyboard/toggle_keyboard_layout.sh";
        };
        "hyprland/language" = {
            "format" = "{short}";
            "on-click" = "/home/admin/.config/waybar/keyboard/toggle_keyboard_layout.sh";
        };
        "battery" = {
            "format" = "{icon}";
            "format-alt" = "{time} {icon}";
            "format-alt-click" = "click-right";
            "format-icons" = [
                ""
                ""
                ""
                ""
            ];
            "format-charging" = " ";
            "interval" = 30;
            "states" = {
                "warning" = 45;
                "critical" = 20;
            };
        };
        "bluetooth" = {
            "format" = "";
        };
        "custom/network" = {
            "format" = "";
        };
        "custom/clock-icon" = {
            "format" = "";
        };
        "clock" = {
            "interval" = 60;
            "format" = "{:%I:%M %p}";
            "max-length" = 25;
        };
        "custom/date-icon" = {
            "format" = "";
        };
        "custom/date" = {
            "interval" = 86400;
            "exec" = "date +'%A, %B %d, %Y'";
            "format" = "{}";
        };
        "custom/power" = {
            "format" = "⏻ ";
            "on-click" = "shutdown -h now";
        };
    }
];
    };
}
