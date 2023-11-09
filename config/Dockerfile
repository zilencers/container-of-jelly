FROM quay.io/aminvakil/debian12-systemd
WORKDIR /setup
COPY add_repo.sh add_repo.sh
RUN apt-get update && apt-get upgrade
RUN apt-get install curl gnupg software-properties-common -y
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/jellyfin.gpg
RUN /setup/add_repo.sh
RUN apt-get update
RUN apt-get install jellyfin-server jellyfin-web -y
RUN systemctl enable jellyfin
CMD [ "/usr/sbin/init" ]

