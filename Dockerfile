# Usando uma imagem base do Ubuntu
FROM ubuntu:20.04

# Variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar e instalar dependências necessárias
RUN apt-get update && \
    apt-get install -y \
    sudo \
    wget \
    curl \
    software-properties-common \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Instalar o ambiente de desktop (exemplo: XFCE)
RUN apt-get update && \
    apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xorg \
    dbus-x11 \
    && rm -rf /var/lib/apt/lists/*

# Instalar o VNC server (para interação com a interface gráfica)
RUN apt-get install -y \
    tightvncserver \
    && rm -rf /var/lib/apt/lists/*

# Criar o usuário
RUN useradd -m -s /bin/bash noejunior299 && \
    echo "noejunior299:12345678" | chpasswd && \
    adduser noejunior299 sudo

# Definir o diretório de trabalho
WORKDIR /home/noejunior299

# Definir o usuário
USER noejunior299

# Expor a porta VNC para conexão
EXPOSE 5901

# Comando para iniciar o VNC server e a interface gráfica
CMD ["bash", "-c", "vncserver :1 -geometry 1280x720 -depth 24 && tail -f /dev/null"]
