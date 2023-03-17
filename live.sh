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
    -c:v libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -c:a aac \
    -filter_complex "[0:a][1:a]amerge=inputs=2[aout]" \
    -map "[aout]" -map 1:v:0 \
    -f flv rtmp://den52.contribute.live-video.net/app/$TWITCH_STREAM_KEY
done