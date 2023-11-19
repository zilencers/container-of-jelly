#!/bin/bash

# Enable linger
#loginctl enable-linger $USER

# Build the podman image
podman build -t jellyfin -f config/Dockerfile

# Create a network for jellyfin
podman network create \
  -d ipvlan \
  --subnet 192.168.0.0/24 \
  --gateway 192.168.0.1 \
  --ip-range 192.168.0.254/32 \
  -o parent=eno1 \
  --ignore \
  jellyfin

# Run the container
podman run -d \
 --name jellyfin \
 --network jellyfin \
 --ip 192.168.0.9 \
 --hostname jellyfin \
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
