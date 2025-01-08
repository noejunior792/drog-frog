FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    sudo \
    vim \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash noejunior299 && \
    echo "noejunior299:12345678" | chpasswd && \
    adduser noejunior299 sudo

WORKDIR /home/noejunior299

USER noejunior299

# Expondo a porta 25565 (padrão para Minecraft)
EXPOSE 25565

CMD ["bash"]
