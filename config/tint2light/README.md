# tint2 Configs

`tint2` config directory should be copied to `$XDG_CONFIG_HOME/tint2` _(provided that the `$XDG_CONFIG_HOME` environment variable is already set - generally, `$HOME/.config`; where `$HOME` is the user's home directory, generally `/home/username`)_

## Autostart

Make sure to add these commands to your WM's or DE's startup/autostart scripts.

```sh
# - example startup/autostart shell script
# - if your WM/DE uses different form of startup script then follow those rules
# - here, everything before '&' is the base command (you may only need the base commands if using some WM/DE which does not uses shell scripts as there startup scripts)
tint2 -c $XDG_CONFIG_HOME/tint2/workspace.tint2rc &
tint2 -c $XDG_CONFIG_HOME/tint2/date.tint2rc &
tint2 -c $XDG_CONFIG_HOME/tint2/info.tint2rc &
tint2 -c $XDG_CONFIG_HOME/tint2/dock.tint2rc &
nm-applet &
```

## Prerequisites

`bc` - Basic Calculator\
`nm-applet` - Network Manager Applet _(network-manager-applet)_\
`pactl` - Pulseaudio Controller\
`pacmd` - Pulseaudio Command\
`pavucontrol` - Pulseaudio Controller GUI\
`ttf-jetbrains-mono` - Jet Brains Mono font

> _Basic `free`, `awk`, `expr`, `read`, `curl`, `cat`, `printf`, `echo` is already present with generally all linux installations. If NOT, then do install them or their alternatives (if using any alternatives, then check executor scripts and its corresponding executor configs to swap those commands out)_

> _Make sure all executor scripts are **executable**_

---

## Executors

### CPU Usage Stats

Executor Script : [cpu](./executors/cpu)\
Executor Config : [info.tint2rc](./info.tint2rc)

```conf
#-------------------------------------
# Executor 1
execp = new
execp_command = $XDG_CONFIG_HOME/tint2/executors/cpu
execp_interval = 3
execp_has_icon = 1
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_monitor = all
execp_tooltip =
execp_lclick_command =
execp_rclick_command =
execp_mclick_command =
execp_uwheel_command =
execp_dwheel_command =
execp_font = JetBrains Mono Bold 10
execp_font_color = #002038 100
execp_padding = 4 0
execp_background_id = 1
execp_centered = 1
execp_icon_w = 16
execp_icon_h = 16
```

### Memory Usage Stats

Executor Script : [mem](./executors/mem)\
Executor Config : [info.tint2rc](./info.tint2rc)

```conf
#-------------------------------------
# Executor 2
execp = new
execp_command = $XDG_CONFIG_HOME/tint2/executors/mem
execp_interval = 3
execp_has_icon = 1
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_monitor = all
execp_tooltip =
execp_lclick_command =
execp_rclick_command =
execp_mclick_command =
execp_uwheel_command =
execp_dwheel_command =
execp_font = JetBrains Mono Bold 10
execp_font_color = #002038 100
execp_padding = 4 0
execp_background_id = 1
execp_centered = 1
execp_icon_w = 16
execp_icon_h = 16
```

### Local Weather Stats

> _Change the `region` variable to your specific local region (use `curl wttr.in?format=3` to get your region name - may vary on network IP location)_

Executor Script : [weather](./executors/weather)\
Executor Config : [info.tint2rc](./info.tint2rc)

```conf
#-------------------------------------
# Executor 3
execp = new
execp_command = $XDG_CONFIG_HOME/tint2/executors/weather
execp_interval = 7200
execp_has_icon = 1
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 0
execp_monitor = all
execp_tooltip =
execp_lclick_command =
execp_rclick_command =
execp_mclick_command =
execp_uwheel_command =
execp_dwheel_command =
execp_font = JetBrains Mono Bold 10
execp_font_color = #002038 100
execp_padding = 4 0
execp_background_id = 1
execp_centered = 1
execp_icon_w = 14
execp_icon_h = 14
```

### Network Stats

> _Change the `n` variable to your network name (generally, one which is connected to the Internet) (you can list your network cards using the `cat /proc/net/dev` and use any **name** from the **Interface** column except `lo` - here, `ens33` is used)_

Executor Script : [net](./executors/net)\
Executor Config : [dock.tint2rc](./dock.tint2rc)

```conf
#-------------------------------------
# Executor 1
execp = new
execp_command = $XDG_CONFIG_HOME/tint2/executors/net
execp_interval = 1
execp_has_icon = 0
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_monitor = all
execp_tooltip =
execp_lclick_command =
execp_rclick_command =
execp_mclick_command =
execp_uwheel_command =
execp_dwheel_command =
execp_font = JetBrains Mono Bold 10
execp_font_color = #002038 100
execp_padding = 4 0
execp_background_id = 2
execp_centered = 1
execp_icon_w = 14
execp_icon_h = 14
```

### Volume Controller

> _Change the `sink` variable to your default audio device. The sink index number can be found using `pacmd list-sinks` command and choose the **index number** of your sound device as the `sink` value. Use the same value for the tint2 config, eg. `execp_lclick_command = pactl set-sink-mute <sink index number> toggle`_

Executor Script : [volume](./executors/volume)\
Executor Config : [dock.tint2rc](./dock.tint2rc)

```conf
#-------------------------------------
# Executor 2
execp = new
execp_command = $XDG_CONFIG_HOME/tint2/executors/volume
execp_interval = 0
execp_has_icon = 1
execp_cache_icon = 1
execp_continuous = 0
execp_markup = 1
execp_monitor = all
execp_tooltip =

# use your sound device sink index number, here: 0
execp_lclick_command = pactl set-sink-mute 0 toggle
execp_uwheel_command = pactl set-sink-volume 0 +2%
execp_dwheel_command = pactl set-sink-volume 0 -2%

execp_rclick_command = pavucontrol
execp_mclick_command =
execp_font = JetBrains Mono Bold 10
execp_font_color = #002038 100
execp_padding = 4 0
execp_background_id = 2
execp_centered = 1
execp_icon_w = 14
execp_icon_h = 14
```

# DE Setup

_This configuration was made using XFCE4 DE on a base Arch linux installation. This configuration specifics are mentioned below but for different distro setups may require a fair bit of manual tweaking of above executor script and button funtions as per the applications or alternatives available for that specific distro._

## Actual Configuration (on Arch-XFCE)

### **0. XFCE Setup**

Font: Jet Brains Mono (ttf-jetbrains-mono)
Audio : pulseaudio, pavucontrol, pacmd, pactl

1. Make sure `$XDG_CONFIG_HOME` is setup. _([How?](https://superuser.com/questions/365847/where-should-the-xdg-config-home-variable-be-defined))_
2. Make 8 workspaces with respective numbers as their _Workspace Name_ in XFCE.\
   _(`xfce4-settings-manager` &rarr; Workspaces &rarr; General\
    No. of workspaces = 8\
    #1 = 1\
    . . . . . \
    #8 = 8)_
3. Add desktop margins in XFCE.\
   _(`xfce4-settings-manager` &rarr; Workspaces. &rarr; Margins\
    Top-Rght-Bottom-Left : 28-8-28-8)_
4. Disable `xfce4-panel`.\
   _(`xfce4-settings-manager` &rarr; Session and Startup &rarr; Currtent Session &rarr; select `xfce4-panel` &rarr; click 'Quit Program' &rarr; click 'Save Session')_

### **1. Tint2 Dock** _([dock.tint2rc](./dock.tint2rc))_

> 📛 For button icons to work, make sure to change the path of the icons in [dock.tint2rc](./dock.tint2rc) using your `username`. i.e.: Open [dock.tint2rc](./dock.tint2rc) in suitable Text Editor and use **Find-All-and-Replace** function of your Text Editor to find-all **poseidon** _(there will be 12 instances)_ and replace with your **username**

_(buttons and executor scripts, present in the bottom tint2-panel, from left-to-right)_

**_(application opener buttons)_**

1. xfce4-appfinder _(App Runner)_
2. xfce4-terminal _(Terminal)_
3. thunar _(File Manager)_
4. firefox _(Web Browser)_
5. code _(VSCode IDE)_
6. lollypop _(Music Player)_
7. telegram-desktop _(Telegram)_
8. xfce4-settings-manager _(Settings Manager)_

**9. _(task bar)_**

**_(executor scripts)_**

10. Download/Upload monitor (`mbps`) _[package requirement: `bc` - Basic Calculator]_
11. Volume Controller _[package requirement: `pulseaudio`, `pavucontrol`, `pacmd`, `pactl` - Pulseaudio & its utilities]_
    -   <kbd>Left Click</kbd> _(toggle Mute : `pacmd` & `pactl`)_
    -   <kbd>Scroll Up</kbd> _(Volume Up : `pacmd` & `pactl`)_
    -   <kbd>Scroll Down</kbd> _(Volume Down : `pacmd` & `pactl`)_
    -   <kbd>Right Click</kbd> _(Audio Controller Settings : `pavucontrol`)_

**_(session handlers buttons)_**

12. pkill -KILL -u `username` _(Logout)_
13. reboot _(Restart)_
14. poweroff _(Shutdown)_
