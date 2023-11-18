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
  -v /srv/share/movies:/mnt/movies:Z \
  -v /srv/share/shows:/mnt/shows:Z \
  -v /srv/share/music:/mnt/music:Z \
  -v /srv/photos:/mnt/photos:Z \
  -v /srv/local/media/movies:/movies:Z \ 
  -v /srv/local/media/shows:/shows:Z \
  -v /srv/local/media/music:/music:Z \
  -v /srv/local/media/photos:/photos:Z \
  localhost/jellyfin:latest
