#!/bin/bash

# Build the podman image
podman build -t jellyfin -f config/Dockerfile

# Run the container
podman run -d \
-v /etc/opt/jellyfin/config:/config \
-v /var/cache/jellyfin/cache:/cache \
-v /srv/jellyfin/media/movies:/movies \
-v /srv/jellyfin/media/shows:/shows \
-v /srv/jellyfin/media/music:/music \
-v /srv/jellyfin/media/photos:/photos \
--name jellyfin \
--net=host \
--restart always \
localhost/jellyfin:latest
