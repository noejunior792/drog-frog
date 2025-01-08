# Usando a imagem base do Ubuntu
FROM ubuntu:20.04

# Variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive
ENV USER_NAME=noejunior299

# Atualizar o repositório e instalar dependências
RUN apt-get update && \
    apt-get install -y \
    sudo \
    curl \
    wget \
    neovim \
    && rm -rf /var/lib/apt/lists/*

# Criar o usuário
RUN useradd -m -s /bin/bash $USER_NAME && \
    echo "$USER_NAME:12345678" | chpasswd && \
    adduser $USER_NAME sudo

# Mudar para o diretório home do usuário
WORKDIR /home/$USER_NAME

# Mudar para o usuário criado
USER $USER_NAME

# Comando padrão para rodar o Neovim
CMD ["nvim"]
