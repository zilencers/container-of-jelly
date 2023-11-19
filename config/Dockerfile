FROM quay.io/fedora/fedora:38
RUN dnf -y install \
   https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
   https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf -y install \
   https://repo.jellyfin.org/releases/server/fedora/stable/server/jellyfin-server-10.8.12-1.fc36.x86_64.rpm \
   https://repo.jellyfin.org/releases/server/fedora/stable/web/jellyfin-web-10.8.12-1.fc36.noarch.rpm
RUN systemctl enable jellyfin
CMD [ "/sbin/init" ]
