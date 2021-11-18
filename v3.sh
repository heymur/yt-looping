#! /bin/bash

VBR=”1500k”
FPS=”24″
QUAL=”superfast”

YOUTUBE_URL=”rtmp://a.rtmp.youtube.com/live2″
YOUTUBE_KEY=”spjs-50hd-ujx2-t2ma-1xe9″
VIDEO_SOURCE=”/home/ubuntu/video/BG Fundo 01 720p.mp4″
AUDIO_ENCODER=”aac”

ffmpeg \
-stream_loop -1 \
-re \
-i “$VIDEO_SOURCE” \
-thread_queue_size 512 \
-stream_loop -1 \
-re \
-f concat -i /home/ubuntu/music/audiofiles.txt \
-map 0:v:0 -map 1:a:0 \
-map_metadata:g 1:g \
-c:v libx264 -preset $QUAL -r $FPS -g $(($FPS *2)) -b:v $VBR -bufsize 3000k -maxrate $VBR \
-c:a $AUDIO_ENCODER -ar 44100 -b:a 128k -pix_fmt yuv420p \
-f flv $YOUTUBE_URL/$YOUTUBE_KEY
