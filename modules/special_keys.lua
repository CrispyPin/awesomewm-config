local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")

require("modules/laptop_detector")

special_keys = gears.table.join(
	awful.key({ "Ctrl" }, "Print", function()
		awful.util.spawn(CONFIG_DIR .. "utils/screenshot_selection.sh")
	end,
		{ description = "Full screenshot", group = "screenshot" }),

	awful.key({}, "Print", function()
		awful.util.spawn(CONFIG_DIR .. "utils/screenshot_full.sh")
	end,
		{ description = "Screenshot selection", group = "screenshot" }),

	awful.key({ "Shift" }, "Print", function()
		awful.util.spawn(CONFIG_DIR .. "utils/record_mp4.sh")
	end,
		{ description = "Screen recording", group = "screenshot" }),

	awful.key({ modkey }, "Print", function()
		awful.util.spawn(CONFIG_DIR .. "utils/screenshot_active.sh")
	end,
		{ description = "Screenshot active", group = "screenshot" }),

	awful.key({ modkey }, "F1", function()
		awful.util.spawn("/home/crispypin/dotfiles/scripts/restart_vr.sh")
	end,
		{ description = "Restart SteamVR", group = "launcher" }),

	-- mouse clicking with F13+ keys
	awful.key({}, "XF86Tools", function()
		awful.util.spawn("xdotool click 1")
	end,
		{ description = "Mouse left click", group = "mouse" }),
	awful.key({}, "XF86Launch5", function()
		awful.util.spawn("xdotool click 3")
	end,
		{ description = "Mouse right click", group = "mouse" }),
	awful.key({}, "XF86Launch6", function()
		awful.util.spawn("xdotool click 2")
	end,
		{ description = "Mouse middle click", group = "mouse" }),

	-- mouse movement
	awful.key({ modkey }, "F7", function()
		awful.util.spawn("xdotool mousemove_relative -- -15 0")
	end,
		{ description = "Mouse left", group = "mouse" }),
	awful.key({ modkey }, "F9", function()
		awful.util.spawn("xdotool mousemove_relative 15 0")
	end,
		{ description = "Mouse right", group = "mouse" }),
	awful.key({ modkey }, "F3", function()
		awful.util.spawn("xdotool mousemove_relative 0 -15")
	end,
		{ description = "Mouse up", group = "mouse" }),
	awful.key({ modkey }, "F8", function()
		awful.util.spawn("xdotool mousemove_relative 0 15")
	end,
		{ description = "Mouse down", group = "mouse" }),

	-- faster mouse movement
	awful.key({ modkey, "Control" }, "F7", function()
		awful.util.spawn("xdotool mousemove_relative -- -200 0")
	end,
		{ description = "Mouse left fast", group = "mouse" }),
	awful.key({ modkey, "Control" }, "F9", function()
		awful.util.spawn("xdotool mousemove_relative 200 0")
	end,
		{ description = "Mouse right fast", group = "mouse" }),
	awful.key({ modkey, "Control" }, "F3", function()
		awful.util.spawn("xdotool mousemove_relative 0 -200")
	end,
		{ description = "Mouse up fast", group = "mouse" }),
	awful.key({ modkey, "Control" }, "F8", function()
		awful.util.spawn("xdotool mousemove_relative 0 200")
	end,
		{ description = "Mouse down fast", group = "mouse" }),

	-- Volume Keys
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.util.spawn("amixer -q -D pulse sset Master 5%-", false)
	end),
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.util.spawn("amixer -q -D pulse sset Master 5%+", false)
	end),
	awful.key({}, "XF86AudioMute", function()
		awful.util.spawn("amixer -D pulse set Master 1+ toggle", false)
	end),
	-- Media Keys
	awful.key({}, "XF86AudioPlay", function()
		awful.util.spawn("playerctl play-pause", false)
	end),
	awful.key({}, "XF86AudioNext", function()
		awful.util.spawn("playerctl next", false)
	end),
	awful.key({}, "XF86AudioPrev", function()
		awful.util.spawn("playerctl previous", false)
	end)
)

if is_laptop then
	special_keys = gears.table.join(
		special_keys,
		awful.key({}, "XF86MonBrightnessUp", function()
			awful.spawn("/usr/bin/simple-brightness -inc 32")
		end,
			{ description = "Increase brightness", group = "laptop" }),

		awful.key({}, "XF86MonBrightnessDown", function()
			awful.spawn("/usr/bin/simple-brightness -dec 32")
		end,
			{ description = "Lower brightness", group = "laptop" })
	)
end
