local awful = require("awful")
require("modules/smart_reload")

if is_reloading() then
	finish_reload()
	return
end

awful.spawn("picom -b") -- compositor
awful.spawn(CONFIG_DIR .. "utils/xrandr_conf.sh") -- xrandr config
awful.spawn(CONFIG_DIR .. "utils/xcape_conf.sh")  -- xcape config
awful.spawn("/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1") -- authentication popup (in pop os)

--awful.spawn("discord")
awful.spawn("discord-ptb")

awful.spawn("gtk-launch com.spotify.Client")
awful.spawn("firefox")

--awful.spawn("alacritty")

awful.spawn("redshift-gtk")
