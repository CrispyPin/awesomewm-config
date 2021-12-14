local awful = require("awful")
require("modules/smart_reload")

if is_reloading() then
	finish_reload()
	return
end

awful.spawn("picom -b") -- compositor
awful.spawn(HOME_DIR .. ".screenlayout/big-big-small.sh") -- xrandr config

--awful.spawn("discord")
awful.spawn("discord-ptb")

awful.spawn("gtk-launch com.spotify.Client")
awful.spawn("firefox")

--awful.spawn("alacritty")
