# Usando a imagem base do Ubuntu
FROM ubuntu:20.04

# Configurando ambiente não interativo para evitar prompts durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar pacotes e instalar SSH, sudo, curl e Docker
RUN apt-get update && \
    apt-get install -y \
    openssh-server \
    sudo \
    curl \
    apt-transport-https \
    ca-certificates \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && \
    apt-get update && \
    apt-get install -y docker-ce && \
    rm -rf /var/lib/apt/lists/*

# Criar diretório necessário para o SSH
RUN mkdir /var/run/sshd

# Criar um usuário com senha e adicionar ao grupo sudo
RUN useradd -m -s /bin/bash noejunior299 && \
    echo "noejunior299:123456789" | chpasswd && \
    adduser noejunior299 sudo

# Permitir login root por SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Ajustar configurações do SSH para permitir login com senha
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expor a porta 22 para conexões SSH
EXPOSE 22

# Copiar o script de inicialização para o container
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Definir o script como comando principal
CMD ["/bin/bash", "/start.sh"]
