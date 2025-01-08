# Use a imagem oficial do Ubuntu
FROM ubuntu:20.04

# Defina as variáveis de ambiente para não interagir com a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualize e instale pacotes necessários
RUN apt-get update && \
    apt-get install -y \
    sudo \
    vim \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Crie o usuário "noejunior299" com a senha "12345678"
RUN useradd -m -s /bin/bash noejunior299 && \
    echo "noejunior299:12345678" | chpasswd && \
    adduser noejunior299 sudo

# Defina o diretório de trabalho
WORKDIR /home/noejunior299

# Defina o usuário para a execução do container
USER noejunior299

# Comando para manter o container ativo
CMD ["bash"]
