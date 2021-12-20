local awful = require("awful")
local gears = require("gears")

special_keys = gears.table.join(
	awful.key({}, "XF86MonBrightnessUp", function ()
		awful.spawn("/usr/bin/simple-brightness -inc 32") end,
	{description = "Increase brightness", group = "Settings"}),

	awful.key({}, "XF86MonBrightnessDown", function ()
		awful.spawn("/usr/bin/simple-brightness -dec 32") end,
	{description = "Lower brightness", group = "Settings"}),

	awful.key({}, "XF86AudioRaiseVolume", function ()
		awful.spawn("amixer sset Master 5+") end,
	{description = "Increase volume", group = "Settings"}),

	awful.key({}, "XF86AudioLowerVolume", function ()
		awful.spawn("amixer sset Master 5-") end,
	{description = "Lower volume", group = "Settings"}),

	awful.key({"Ctrl"}, "Print", function ()
		awful.util.spawn(CONFIG_DIR .. "utils/screenshot_selection.sh") end,
	{description = "Full screenshot", group = "Settings"}),

	awful.key({ }, "Print", function ()
		awful.util.spawn(CONFIG_DIR .. "utils/screenshot_full.sh") end,
	{description = "Screenshot selection", group = "Settings"}),

	awful.key({"Shift"}, "Print", function ()
		awful.util.spawn("deepin-screen-recorder") end,
	{description = "Screen recording", group = "Settings"})
	)