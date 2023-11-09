## Jellyfin Container

git clone https://github.com/zilencers/container-of-jelly.git

cd container-of-jelly

podman build -t jellyfin -f Dockerfile

podman run \ 
-d \
-v /etc/opt/jellyfin/config:/config \
-v /var/cache/jellyfin/cache:/cache \
-v /srv/jellyfin/media/movies:/movies \
-v /srv/jellyfin/media/shows:/shows \
-v /srv/jellyfin/media/music:/music \
-v /srv/jellyfin/media/photos:/photos \
--net=host \
--restart always \
localhost/jellyfin:latest

