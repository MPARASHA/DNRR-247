#!/bin/bash

ffmpeg -stream_loop -1 -re -i video.mp4 -loglevel warning -c:v libx264 -b:v 2M -strict -2 -flags +global_header -bsf:a aac_adtstoasc -bufsize 2100k -f flv rtmp://den52.contribute.live-video.net/app/$TWITCH_STREAM_KEY
