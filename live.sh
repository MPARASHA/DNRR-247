#!/bin/bash

set -e

while true
do
ffmpeg -stream_loop -1 -re -i video.mp4 -pix_fmt yuvj420p -x264-params keyint=48:min-keyint=48:scenecut=-1 -b:v 88700k -b:a 128k -ar 44100 -acodec aac -vcodec libx264 -preset medium -crf 28 -threads 4 -f flv rtmp://den52.contribute.live-video.net/app/$TWITCH_STREAM_KEY
done