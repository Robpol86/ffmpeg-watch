FROM alpine:latest
ARG TARGETARCH

# Install ffmpeg.
RUN --mount=type=bind,target=/repo --mount=type=tmpfs,target=/tmp \
    cd /tmp && \
    tar -xvf "/repo/_resources/ffmpeg-git-$TARGETARCH-static.tar.xz" --strip-components=1 && \
    cp -v ffmpeg ffprobe /usr/local/bin/ && \
    ffprobe -version && \
    ffmpeg -version
