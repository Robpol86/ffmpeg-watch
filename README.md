# ffmpeg-watch

Watch a directory and transcode all videos into an output directory.

## TODO

```bash
cd ~/tmp
install -m0755 /dev/stdin ffmpeg-commands.sh <<< '#!/bin/bash -eux'
find /storage/20200627 -size +20M -print0 |sort -zR |while IFS= read -r -d '' file; do
    o="${file/20200627/Temporary\/Phone}"
    out="${o%.*}.mp4"
    mkdir -vp "$(dirname "$out")"
    printf "ffmpeg -n -i %q -map 0:v:0 -map 0:a:0 -sn -c:a aac -b:a 128k -vf \"scale=-2:'min(720,ih)'\" -tag:v hvc1 -c:v libx265 -crf 30 %q\n" \
        "$file" "$out" >> ffmpeg-commands.sh
done
```
