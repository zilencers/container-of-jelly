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
-v /srv/jellyfin/family/movies:/srv/family/movies \
-v /srv/jellyfin/family/music:/srv/family/music \
-v /srv/jellyfin/family/shows:/srv/family/shows \
-v /srv/jellyfin/family/photos:/srv/family/photos \
-v /srv/jellyfin/users/mom:/srv/users/mom \
-v /srv/jellyfin/users/mom/music:/srv/users/mom/music \
-v /srv/jellyfin/users/brandon:/srv/users/brandon \
-v /srv/jellyfin/users/brandon/music:/srv/users/brandon/music \
-v /srv/jellyfin/users/brandon/photos:/srv/users/brandon/photos \
-v /srv/jellyfin/users/brandon/movies:/srv/users/brandon/movies \
-v /srv/jellyfin/users/brandon/shows:/srv/users/brandon/shows \
--name jellyfin \
--net=host \
--restart always \
localhost/jellyfin:latest
