#!/bin/bash

# Create jellyfin group
groupadd -U conman jellyfin

# Make media directories
mkdir -p /etc/opt/jellyfin/config
mkdir -p /var/cache/jellyfin/cache
mkdir -p /srv/jellyfin/media/{movies,shows,music,photos}

# Change owner and group
chown -R root:jellyfin /srv/jellyfin
chown -R root:jellyfin /etc/opt/jellyfin
chown -R root:jellyfin /var/cache/jellyfin

# Switch to user conman
su - conman

# Clone github repo
git clone https://github.com/zilencers/container-of-jelly.git

# Change directory 
cd container-of-jelly

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
-t jellyfin \
--net=host \
--restart always \
localhost/jellyfin:latest
