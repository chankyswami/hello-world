FROM ubuntu:latest
RUN export ARTIFACTORY_API_KEY=$ARTIFACTORY_API_KEY
ENV USER_NAME=chanky
ENV USER_PASSWORD=Pagal@123
RUN apt-get update && \
    apt-get install -y sudo && \
    useradd -m $USER_NAME && \
    echo "$USER_NAME:$USER_PASSWORD" | chpasswd && \
    adduser $USER_NAME sudo
RUN echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USER_NAME
WORKDIR /home/$USER_NAME
CMD ["tail", "-f", "/dev/null"]