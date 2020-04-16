# Use the latest version of Ubuntu
FROM ubuntu:latest

# Work from this directory
WORKDIR /work

RUN apt-get update && apt-get install -y file libarchive-tools fakeroot git wget curl gpg libxml2 xz-utils cmake sudo && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/devkitPro/pacman/releases/download/devkitpro-pacman-1.0.1/devkitpro-pacman.deb
RUN dpkg -i devkitpro-pacman.deb
RUN rm devkitpro-pacman.deb
COPY dkp-env.sh /work
RUN ./dkp-env.sh dkp-pacman --noconfirm -S deko3d libnx switch-examples devkit-env devkitA64 general-tools switch-tools uam # switch-dev
RUN adduser --help
RUN adduser --disabled-password --gecos "" dkp
RUN echo "dkp ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "" >> /opt/devkitpro/pacman/etc/pacman.conf
RUN echo "[comp_hack]" >> /opt/devkitpro/pacman/etc/pacman.conf
RUN echo "Server = https://compomega.github.io/devkitPro-repo/any" >> /opt/devkitpro/pacman/etc/pacman.conf

COPY build.sh /work

ENTRYPOINT ["/work/build.sh"]
