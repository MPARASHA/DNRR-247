#!/bin/bash

ffmpeg -y -i video.mp4 -c:v libx264 -b:v 3000k -r 60 -vsync cfr -pass 1 -c:a copy -f null /dev/null
ffmpeg -i video.mp4 -c:v libx264 -b:v 3000k -r 60 -pass 2 -c:a copy output.mp4
ffmpeg -stream_loop -1 -i output.mp4 -vsync cfr -c:v libx264 -s 852x480 -r 30 -f flv rtmp://den52.contribute.live-video.net/app/$TWITCH_STREAM_KEY
