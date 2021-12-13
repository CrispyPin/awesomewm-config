local awful = require("awful")

function file_exists(name)
	local f=io.open(name,"r")
	if f~=nil then
		io.close(f)
		return true
	else 
		return false
	end
end
if file_exists(HOME_DIR .. ".awesome_is_restarting") then
	awful.spawn("rm " .. HOME_DIR .. ".awesome_is_restarting")
	return
end

awful.spawn("picom -b") -- compositor
awful.spawn(HOME_DIR .. ".screenlayout/big-big-small.sh") -- xrandr config

--awful.spawn("discord")
awful.spawn("discord-ptb")

awful.spawn("gtk-launch com.spotify.Client")
awful.spawn("firefox")

--awful.spawn("alacritty")
