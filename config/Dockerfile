FROM ubuntu:mantic
WORKDIR /setup
COPY add_repo.sh add_repo.sh
RUN apt-get update && apt-get upgrade
RUN apt-get install curl ffmpeg gnupg software-properties-common -y
#RUN sudo add-apt-repository universe -y
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor -o /etc/apt/keyrings/jellyfin.gpg
RUN /setup/add_repo.sh
RUN apt-get update
RUN apt-get install jellyfin-server jellyfin-web -y
RUN systemctl enable jellyfin
CMD [ "/usr/sbin/init" ]

