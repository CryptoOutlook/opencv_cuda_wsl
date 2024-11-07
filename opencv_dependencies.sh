
printf "\\n%.s" 1

printf -v \
video "Video/Audio Libs - FFMPEG, GSTREAMER, x264 and so on."

printf "#%.s" {1..72}
sleep 5

printf "\\r%.s" {1..72}
sleep 5

printf "%60s %10s" "${video}" "-----"
sleep 5

printf "\\n%.s" 1


bash test.sh