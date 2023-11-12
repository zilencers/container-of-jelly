#!/bin/bash

# Build the podman image
podman build -t jellyfin -f config/Dockerfile

# Run the container
podman run -d \
-v /etc/opt/jellyfin/config:/config \
-v /var/cache/jellyfin/cache:/cache \
-v /srv/jellyfin/media/movies:/srv/movies \
-v /srv/jellyfin/media/shows:/srv/shows \
-v /srv/jellyfin/media/music:/srv/music \
-v /srv/jellyfin/media/photos:/srv/photos \
-v /srv/jellyfin/media/dvr:/srv/dvr \
-v /srv/jellyfin/users/mom/music:/srv/users/mom/music \
-v /srv/jellyfin/users/brandon/music:/srv/users/brandon/music \
-v /srv/jellyfin/users/brandon/photos:/srv/users/brandon/photos \
-v /srv/jellyfin/users/brandon/movies:/srv/users/brandon/movies \
-v /srv/jellyfin/users/brandon/shows:/srv/users/brandon/shows \
--label "io.containers.autoupdate=registry" \
--name jellyfin \
--net=host \
localhost/jellyfin:latest

