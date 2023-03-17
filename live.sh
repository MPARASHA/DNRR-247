#!/bin/bash

ffmpeg -re -i "video.mkv" -c:v copy -c:a aac -ar 44100 -ac 1 -f flv rtmp://den52.contribute.live-video.net/app/$TWITCH_STREAM_KEY
