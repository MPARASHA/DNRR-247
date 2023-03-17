#!/bin/bash

set -e

VBR="2500k"                                    # Bitrate de la vidéo en sortie
FPS="30"                                       # FPS de la vidéo en sortie
QUAL="medium"
TWITCH_STREAM_KEY="live_721961566_dc7k5h2sFcx2ikucZTvtUfNC8Drbrc"

while true
do
ffmpeg \
    -stream_loop -1 -i "video.mp4" \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv -f flv rtmp://den52.contribute.live-video.net/app/$TWITCH_STREAM_KEY
done