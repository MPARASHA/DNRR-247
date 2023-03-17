#!/bin/bash

ffmpeg -stream_loop -1 -i video.mp4 -c:v libx264 -s 852x480 -r 30 -f flv rtmp://den52.contribute.live-video.net/app/$TWITCH_STREAM_KEY
