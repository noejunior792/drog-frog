# Usando a imagem base do Ubuntu
FROM ubuntu:20.04

# Configurando ambiente não interativo para evitar prompts durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar pacotes e instalar SSH, sudo, e curl para obter o IP público
RUN apt-get update && \
    apt-get install -y \
    openssh-server \
    sudo \
    curl && \
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

# Expor a porta do SSH
EXPOSE 22

# Script para exibir o IP público no terminal
RUN echo '#!/bin/bash\n\
PUBLIC_IP=$(curl -s ifconfig.me)\n\
echo "============================="\n\
echo "Acesse o SSH usando o comando:"\n\
echo "ssh noejunior299@$PUBLIC_IP -p 22"\n\
echo "============================="\n\
/usr/sbin/sshd -D' > /start.sh && chmod +x /start.sh

# Comando para iniciar o script ao iniciar o container
CMD ["/bin/bash"]
