local awful = require("awful")

CONFIG_DIR = awful.util.get_configuration_dir()
HOME_DIR = CONFIG_DIR .. "../../"

local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else 
		return false
	end
end

local INDICATOR_FILE = "/tmp/awesome_is_restarting"

test = function ()
	local focused_client = awful.client.focus.history.get()
	focused_client:raise()
end


smart_reload = function ()
	awful.spawn("touch " .. INDICATOR_FILE)
	awesome.restart()
end

is_reloading = function ()
	return file_exists(INDICATOR_FILE)
end

finish_reload = function ()
	awful.spawn("rm " .. INDICATOR_FILE)
end