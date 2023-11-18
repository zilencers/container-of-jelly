#!/bin/bash

# Enable linger
loginctl enable-linger $USER

# Build the podman image
podman build -t jellyfin -f config/Dockerfile

# Run the container
podman run -d \
 --name jellyfin \
 --label "io.containers.autoupdate=registry" \
 --net=host \
 --user $(id -u):$(id -g) \
 --userns keep-id \
 --volume /etc/opt/jellyfin/config:/config \
 --volume /var/cache/jellyfin/cache:/cache \
 --volume /srv/share/movies:/mnt/movies \
 --volume /srv/share/shows:/mnt/shows \
 --volume /srv/share/music:/mnt/music \
 --volume /srv/share/photos:/mnt/photos \
 --volume /srv/local/media/movies:/movies \
 --volume /srv/local/media/shows:/shows \
 --volume /srv/local/media/music:/music \
 --volume /srv/local/media/photos:/photos \
 localhost/jellyfin:latest
