{ pkgs, ... }:
{
home.file.".config/hypr/hyprland.conf".text = ''
################
### MONITORS ###
################

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=eDP-1,1920x1080,auto,1
monitor=DP-1,2560x1440,auto,1
monitor=DP-2,1920x1080,auto,1,transform,1

###################
### MY PROGRAMS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords/

# Set programs that you use
$terminal = alacritty
$menu = rofi -show drun -show-icons

#################
### AUTOSTART ###
#################

# Autostart necessary processes (like notifications daemons, status bars, etc.)
# Or execute your favorite apps at launch like this:

# exec-once = $terminal
# exec-once = nm-applet &
exec-once = hyprpaper &
exec-once = xhost +local:docker
exec-once = hyprlock

#####################
### LOOK AND FEEL ###
#####################
general {
    gaps_in = 0,10,10,0
    gaps_out = 40,10,10,10

    border_size = 2

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    col.active_border = rgba(FFA500ee) rgba(A500FFee) 90deg
    col.inactive_border = rgba(00000000)
    windowrulev2 = noshadow, focus:0
    windowrulev2 = rounding 0, class:^[fF]irefox
    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false

    layout = dwindle

}

# https://wiki.hyprland.org/Configuring/Variables/#decoration
decoration {
    rounding = 8

    # Change transparency of focused and unfocused windows
    active_opacity = 0.8
    inactive_opacity = 0.8
    fullscreen_opacity = 0.8

    shadow {
	enabled = true
	range = 4
	render_power = 3
	color = rgba(1a1a1aee)
    }

    # https://wiki.hyprland.org/Configuring/Variables/#blur
    blur {
	enabled = true
	size = 3
	passes = 5
	new_optimizations = true
	xray = true
	popups = true
    }
    layerrule = blur,input_methods_ignorealpha,waybar
}

# https://wiki.hyprland.org/Configuring/Variables/#animations
animations {
    enabled = yes, please :)

    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = easeOutQuint,0.23,1,0.32,1
    bezier = easeInOutCubic,0.65,0.05,0.36,1
    bezier = linear,0,0,1,1
    bezier = almostLinear,0.5,0.5,0.75,1.0
    bezier = quick,0.15,0,0.1,1

    animation = global, 1, 10, default
    animation = border, 1, 5.39, easeOutQuint
    animation = windows, 1, 4.79, easeOutQuint
    animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
    animation = windowsOut, 1, 1.49, linear, popin 87%
    animation = fadeIn, 1, 1.73, almostLinear
    animation = fadeOut, 1, 1.46, almostLinear
    animation = fade, 1, 3.03, quick
    animation = layers, 1, 3.81, easeOutQuint
    animation = layersIn, 1, 4, easeOutQuint, fade
    animation = layersOut, 1, 1.5, linear, fade
    animation = fadeLayersIn, 1, 1.79, almostLinear
    animation = fadeLayersOut, 1, 1.39, almostLinear
    animation = workspaces, 1, 1.94, almostLinear, fade
    animation = workspacesIn, 1, 1.21, almostLinear, fade
    animation = workspacesOut, 1, 1.94, almostLinear, fade
}

# Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
# "Smart gaps" / "No gaps when only"
# uncomment all if you wish to use that.
# workspace = w[tv1], gapsout:0, gapsin:0
# workspace = f[1], gapsout:0, gapsin:0
# windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
# windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
# windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
# windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
dwindle {
    pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # You probably want this
    force_split = 2
}

# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
master {
    new_status = slave
}

# https://wiki.hyprland.org/Configuring/Variables/#misc
misc {
    force_default_wallpaper = 1 # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
}

#############
### INPUT ###
#############
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    sensitivity = 0.5 # -1.0 - 1.0, 0 means no modification.

    touchpad {
	natural_scroll = false
    }
}

# https://wiki.hyprland.org/Configuring/Variables/#gestures
gestures {
    workspace_swipe = false
}

group {
    insert_after_current = false
    col.border_active = rgba(FFA500ee) rgba(A500FFee) 90deg
    col.border_inactive = rgba(00000000) rgba(00000000) 0deg
    groupbar {
	font_size = 10
	render_titles = true
	height = 16
	col.active = rgba(FFA5009D)
	col.inactive = rgba(A500FF2F)
    }
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
device {
    name = epic-mouse-v1
    sensitivity = -0.5
}


###################
### KEYBINDINGS ###
###################
$mainMod = ALT # Sets "Windows" key as main modifier

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = CONTROL SHIFT, RETURN, exec, $terminal
bind = $mainMod SHIFT, Q, killactive,
bind = $mainMod SHIFT, E, exit,
bind = $mainMod, F, fullscreen
bind = $mainMod, V, togglefloating,
bind = $mainMod, D, exec, $menu
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind = $mainMod, L, exec, hyprlock

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic

# Special workspace
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Tab Layout
bind = $mainMod, W, togglegroup
bind = SUPER, left, changegroupactive, b
bind = SUPER, right, changegroupactive, f

# Groups
bind = SUPER SHIFT, left, movewindoworgroup, l
bind = SUPER SHIFT, right, movewindoworgroup, r
bind = SUPER SHIFT, up, movewindoworgroup, u
bind = SUPER SHIFT, down, movewindoworgroup, d

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move windows with mainMod + LMB/RMB and dragging
bindm = ALT, mouse:272, movewindow
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d

# Resize windows with mainMod + LMB/RMB and dragging
bind = SUPER SHIFT, left, resizeactive,-50 0
bind = SUPER SHIFT, right, resizeactive,50 0
bind = SUPER SHIFT, up, resizeactive,0 -50
bind = SUPER SHIFT, down, resizeactive,0 50

# Screenshot
bind = $mainMod SHIFT, P, exec, hyprshot -m region

# Laptop multimedia keys for volume and LCD brightness
bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

# Requires playerctl
bindl = , XF86AudioNext, exec, playerctl next
bindl = , XF86AudioPause, exec, playerctl play-pause
bindl = , XF86AudioPlay, exec, playerctl play-pause
bindl = , XF86AudioPrev, exec, playerctl previous

##############################
### WINDOWS AND WORKSPACES ###
##############################
# Ignore maximize requests from apps. You'll probably like this.
windowrulev2 = suppressevent maximize, class:.*

# Fix some dragging issues with XWayland
windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
        '';
}
