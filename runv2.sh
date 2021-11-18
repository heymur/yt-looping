#! /bin/bash
VBR="750k"                                    
FPS="30"                                    
QUAL="veryfast"                              
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"

SOURCE="out.mp4"           
KEY="*********"                               

ffmpeg \
    -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"
