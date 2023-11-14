#!/bin/bash

# Build the podman image
podman build -t jellyfin -f config/Dockerfile

# Run the container
podman run -d \
  --name jellyfin \
  --label "io.containers.autoupdate=registry" \
  --net=host \
  --user $(id -u):$(id -g) \
  --userns keep-id \
  -v /etc/opt/jellyfin/config:/config:Z \
  -v /var/cache/jellyfin/cache:/cache:Z \
  -v /mnt/movies:/mnt/movies:Z \
  -v /mnt/shows:/mnt/show:Z \
  -v /mnt/music:/mnt/music:Z \
  -v /mnt/photos:/mnt/photos:Z \
  -v /srv/local/media/movies:/movies:Z \ 
  -v /srv/local/media/shows:/shows:Z \
  -v /srv/local/media/music:/music:Z \
  -v /srv/local/media/photos:/photos:Z \
  localhost/jellyfin:latest
