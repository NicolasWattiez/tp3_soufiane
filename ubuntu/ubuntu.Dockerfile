FROM ubuntu:latest

WORKDIR /home

RUN apt update
RUN mkdir -p /run/sshd
RUN apt install -y python3 openssh-server
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN echo 'root:toor' | chpasswd