#!/bin/bash
statusfile="/tmp/screen_recorder_running"
if [ -f $statusfile ]; then
	ffpid=$(cat $statusfile)
	kill $ffpid
	rm $statusfile
	exit 0
fi

# select area of screen and record it
slop=$(slop -f "%x %y %w %h %g %i" --color=0.8,0.4,1.0,1.0) || exit 1
read -r X Y W H G ID < <(echo $slop)

mkdir -p $(xdg-user-dir VIDEOS)/screen-recordings
videofile=$(xdg-user-dir VIDEOS)/screen-recordings/selection_$(date "+%Y.%m.%d-%H:%M:%S").mp4

ffmpeg -y -video_size "$W"x"$H" -f x11grab -i $DISPLAY+$X,$Y $videofile &
echo $! > $statusfile
