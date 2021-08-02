local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local piechart_widget, piechart_timer = awful.widget.watch("simple-brightness get", 1,
    function(widget, stdout)
        val = tonumber(stdout)
        widget.data_list = {
            { "brightness", val},
            { "fill", 255 - val}
        }
        widget.display_labels = false
        widget.forced_height = 24
        widget.forced_width = 24
        widget.border_color = "#ffff00"
        --widget.border_width = 0
        widget.colors = {"#ffff00", "#000000"}
    end,
    wibox.widget.piechart()
)

local inc_f = function(amt)
    awful.spawn("simple-brightness inc " .. tostring(amt))
    -- TODO: force update, decrease watch frequency
    --piechart_timer
end

brightness = {
    piechart = piechart_widget,
    inc = inc_f
}
