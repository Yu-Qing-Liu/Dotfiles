{
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      style = builtins.readFile ./style.css;
      settings = [{
        "mode" = "overlay";
        "fixed-center" = false;
        "name" = "bar1";
        "output" = [
          "eDP-1"
          "DP-1"
          "DP-2"
        ];
        "margin" = "7px 6px 0px 6px";
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
          "custom/disk-icon"
          "disk"
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
          "all-outputs" = true;
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
        "custom/disk-icon" = {
          "format" = "";
        };
        "disk" = {
          "interval" = 30;
          "format" = "{percentage_used}%";
          "unit" = "GB";
          "path" = "/";
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
          "on-click" = "toggle_kb";
        };
        "hyprland/language" = {
          "format" = "{short}";
          "on-click" = "toggle_kb";
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
      }];
    };
}
