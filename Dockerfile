# Usando a imagem do OpenJDK 17 como base, que é necessária para rodar o TLauncher
FROM openjdk:11

# Variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive
ENV USER_NAME=noejunior299
ENV TLAUNCHER_VERSION=2.90.1
ENV MINECRAFT_VERSION=1.20.4-forgeOptifine

# Instalar dependências necessárias
RUN apt-get update && \
    apt-get install -y \
    sudo \
    curl \
    wget \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Criar o usuário
RUN useradd -m -s /bin/bash $USER_NAME && \
    echo "$USER_NAME:12345678" | chpasswd && \
    adduser $USER_NAME sudo

# Mudar para o diretório home do usuário
WORKDIR /home/$USER_NAME

# Baixar e instalar o TLauncher
RUN wget https://tlauncher.org/downloads/tlauncher-${TLAUNCHER_VERSION}-linux-x64.tar.gz && \
    tar -xvzf tlauncher-${TLAUNCHER_VERSION}-linux-x64.tar.gz && \
    rm tlauncher-${TLAUNCHER_VERSION}-linux-x64.tar.gz

# Expor a porta para o servidor Minecraft
EXPOSE 25565

# Definir o diretório do TLauncher
WORKDIR /home/$USER_NAME/tlauncher

# Rodar o TLauncher
USER $USER_NAME
CMD ["bash", "tlauncher"]
