## Jellyfin Container

### Step 1
git clone (repo)

### Step 2
cd container-of-jelly

### Step 3
podman build -t jellyfin -f Dockerfile

### Step 4
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

