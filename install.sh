#!/bin/bash

# Enable linger
#loginctl enable-linger $USER

# Build the podman image
podman build -t jellyfin -f config/Dockerfile

# Run the container
podman run -d \
 --name jellyfin \
 --net=host \
 --volume /etc/opt/jellyfin/config:/config:Z \
 --volume /var/cache/jellyfin/cache:/cache:Z \
 --volume /srv/share/movies:/mnt/movies \
 --volume /srv/share/shows:/mnt/shows \
 --volume /srv/share/music:/mnt/music \
 --volume /srv/share/photos:/mnt/photos \
 --volume /srv/local/media/movies:/movies:Z \
 --volume /srv/local/media/shows:/shows:Z \
 --volume /srv/local/media/music:/music:Z \
 --volume /srv/local/media/photos:/photos:Z \
 localhost/jellyfin:latest
