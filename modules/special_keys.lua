local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")


special_keys = gears.table.join(
	awful.key({}, "XF86MonBrightnessUp", function ()
		awful.spawn("/usr/bin/simple-brightness -inc 32") end,
	{description = "Increase brightness", group = "laptop"}),

	awful.key({}, "XF86MonBrightnessDown", function ()
		awful.spawn("/usr/bin/simple-brightness -dec 32") end,
	{description = "Lower brightness", group = "laptop"}),

	awful.key({}, "XF86AudioRaiseVolume", function ()
		awful.spawn("amixer sset Master 5+") end,
	{description = "Increase volume", group = "laptop"}),

	awful.key({}, "XF86AudioLowerVolume", function ()
		awful.spawn("amixer sset Master 5-") end,
	{description = "Lower volume", group = "laptop"}),


	awful.key({"Ctrl"}, "Print", function ()
		awful.util.spawn(CONFIG_DIR .. "utils/screenshot_selection.sh") end,
	{description = "Full screenshot", group = "screenshot"}),

	awful.key({ }, "Print", function ()
		awful.util.spawn(CONFIG_DIR .. "utils/screenshot_full.sh") end,
	{description = "Screenshot selection", group = "screenshot"}),

	awful.key({"Shift"}, "Print", function ()
		awful.util.spawn(CONFIG_DIR .. "utils/record_mp4.sh") end,
	{description = "Screen recording", group = "screenshot"}),

	awful.key({modkey}, "Print", function ()
		awful.util.spawn(CONFIG_DIR .. "utils/screenshot_active.sh") end,
	{description = "Screenshot active", group = "screenshot"})

)