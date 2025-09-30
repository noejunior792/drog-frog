# Usar a imagem base do Ubuntu 20.04
FROM ubuntu:20.04

# Evitar prompts interativos durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instalar o servidor OpenSSH, sudo e um editor de texto
RUN apt-get update && apt-get install -y openssh-server sudo nano

# Criar o diretório do serviço SSH
RUN mkdir /var/run/sshd

# Criar um novo usuário 'noejunior299' e definir a senha
RUN useradd -m -s /bin/bash noejunior299
RUN echo 'noejunior299:123456789' | chpasswd

# Adicionar o usuário ao grupo sudo
RUN usermod -aG sudo noejunior299

# Permitir autenticação por senha no SSH
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/PasswordAuthentication no/#PasswordAuthentication no/' /etc/ssh/sshd_config

# Expor a porta SSH e a porta do serviço web
EXPOSE 22 10000

# Copiar o script de inicialização para o contêiner
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Definir o comando para executar na inicialização do contêiner
CMD ["/start.sh"]