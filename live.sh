ffmpeg -stream_loop -1 -re -i "video.mkv" -c:v libx264 -preset veryfast -b:v 6000k -maxrate 6000k -bufsize 6000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 160k -ac 2 -ar 44100 -f flv rtmp://iad05.contribute.live-video.net/app/$TWITCH_STREAM_KEY

