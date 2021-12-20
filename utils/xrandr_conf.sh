#!/bin/sh
xrandr --output DisplayPort-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --set TearFree on  \
--output DisplayPort-1 --off \
--output DisplayPort-2 --mode 1920x1080 --pos 0x0 --rotate normal --set TearFree on \
--output HDMI-A-0 --mode 1280x1024 --pos 3840x0 --rotate normal --set TearFree on

#xrandr --output HDMI-A-0 --transform 1.0000,0.0000,0,0.0000,1.0000,0,0,0,1
#xrandr --output HDMI-A-0 --transform 0.97815,-0.20791,0,0.20791,0.97815,0,0,0,1
#xrandr --output HDMI-A-0 --transform 0.99619,-0.087156,0,0.087156,0.99619,0,0,0,1
