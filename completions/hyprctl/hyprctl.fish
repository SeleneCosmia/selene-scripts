# Fish shell completions for the hyprctl command
#
# authored by: SeleneCosmia on github

# these are all the subcommands that hyprctl knows
set -l commands activewindow activeworkspace binds clients cursorpos decorations devices dispatch getoption \
globalshortcuts hyprpaper instances keyword kill layers layouts monitors notify plugin reload \
setcursor seterror setprop splash switchxkblayout systeminfo version workspacerules workspaces

# list of dispatchers that hyprctl dispatch has access to
set -l dispatchers exec execr pass killactive closewindow workspace movetoworkspace togglefloating \
    fullscreen fakefullscreen dpms pin movefocus movewindow swapwindow centerwindow resizeactive submap \
    moveactive resizewindowpixel movewindowpixel cyclenext swapnext focuswindow focusmonitor global \
    splitratio toggleopaque movecursortocorner movecursor renameworkspace exit forcerendererreload \
    movecurrentworkspacetomonitor focusworkspaceoncurrentmonitor moveworkspacetomonitor swapactiveworkspaces \
    bringactivetotop alterzorder togglespecialworkspace focusurgentorlast togglegroups lockactivegroup \
    moveintogroup moveoutofgroup movewindowfromgroup movegroupwindow denywindowfromgroup setignoregrouplock

# keywords
set -l  keywords general: decoration: decoration:blur: animations: input: input:touchpad: input:touchdevice: \
    input:tablet: gestures: group: group:groupbar: misc: xwayland: opengl: debug: bind monitor

set -l inst $HYPRLAND_INSTANCE_SIGNATURE
set -l inst_idx (math (count "$inst") - 1)

set -l nocmd "not __fish_seen_subcommand_from $commands"
set -l cmd "__fish_seen_subcommand_from $commands"
set -l from_dispatch "__fish_seen_subcommand_from dispatch"

# disable file completions when hyprctl is called
complete -c hyprctl -f

complete -c hyprctl -n "$nocmd" \
    -a "activewindow activeworkspace binds clients cursorpos decorations devices dispatch getoption \
globalshortcuts hyprpaper instances keyword kill layers layouts monitors notify plugin reload \
setcursor seterror setprop splash switchxkblayout systeminfo version workspacerules workspaces"

complete -c hyprctl -n "$cmd" -s j -x -d 'Print output in JSON'
complete -c hyprctl -n "$cmd" -s r -x -d 'Refresh state after issuing command'
complete -c hyprctl -n "$nocmd" -a "-i --instance" -d 'execute command on selected instance'
complete -c hyprctl -n "$nocmd" -a "--batch" -d 'execute a batch of commands, separated with ";"'

complete -c hyprctl -n "$nocmd" -a "activewindow" -d 'Print active window name and properties'
complete -c hyprctl -n "$nocmd" -a "activeworkspace" -d 'Print the active workspace and its properties'
complete -c hyprctl -n "$nocmd" -a "binds" -d 'List all registered keybinds'
complete -c hyprctl -n "$nocmd" -a "clients" -d 'List all windows with their properties'
complete -c hyprctl -n "$nocmd" -a "cursorpos" -d 'Get the current cursor pos in global layout coords'
complete -c hyprctl -n "$nocmd" -a "decorations" -d 'Lists all decorations and their info'
complete -c hyprctl -n "$nocmd" -a "devices" -d 'Lists all connected devices'
complete -c hyprctl -n "$nocmd" -a "dispatch" -d 'Issues a dispatch call with optional arg(s)'
complete -c hyprctl -n "$nocmd" -a "getoption" -d 'Print the config values for given option'
complete -c hyprctl -n "$nocmd" -a "globalshortcuts" -d 'TBD'
complete -c hyprctl -n "$nocmd" -a "hyprpaper" -d 'TBD'
complete -c hyprctl -n "$nocmd" -a "instances" -d 'Lists all running instances with their info'
complete -c hyprctl -n "$nocmd" -a "keyword" -d 'Calls a config keyword dynamically'
complete -c hyprctl -n "$nocmd" -a "kill" -x -d 'Kill an app by clicking on it, cancel with ESC'
complete -c hyprctl -n "$nocmd" -a "layers" -d 'Lists all layers'
complete -c hyprctl -n "$nocmd" -a "layouts" -d 'List available layouts, including plugin layouts'
complete -c hyprctl -n "$nocmd" -a "monitors" -d 'Lists active monitors and their properties'
complete -c hyprctl -n "$nocmd" -a "notify" -d 'Sends a notification using Hyprland\'s built-in system'
complete -c hyprctl -n "$nocmd" -a "plugin" -d 'TBD'
complete -c hyprctl -n "$nocmd" -a "reload" -x -d 'Force reload the config'
complete -c hyprctl -n "$nocmd" -a "setcursor" -d 'Set the cursor theme and reload the cursor manager'
complete -c hyprctl -n "$nocmd" -a "seterror" -d 'Sets the hyprctl error string, resets on reload'
complete -c hyprctl -n "$nocmd" -a "setprop" -d 'Sets a window prop, can be locked by adding "lock"'
complete -c hyprctl -n "$nocmd" -a "splash" -d 'Prints the current random splash'
complete -c hyprctl -n "$nocmd" -a "switchxkblayout" -d 'Sets the xkb layout index for a keyboard'
complete -c hyprctl -n "$nocmd" -a "systeminfo" -d 'Print all info about the current system'
complete -c hyprctl -n "$nocmd" -a "version" -d 'Print current Hyprland version info'
complete -c hyprctl -n "$nocmd" -a "workspacerules" -d 'Lists defined workspace rules'
complete -c hyprctl -n "$nocmd" -a "workspaces" -d 'Lists all workspaces and their properties'

complete -c hyprctl -n "__fish_contains_opt -s i instance" -x -a "
"$HYPRLAND_INSTANCE_SIGNATURE"\t'instance id'
"$inst_idx"\t'instance index'
"
