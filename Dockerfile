# Usar a imagem base do Ubuntu 20.04
FROM ubuntu:20.04

# Evitar prompts interativos durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências: sudo, nodejs, npm
RUN apt-get update && apt-get install -y sudo nodejs npm

# Instalar o Wetty globalmente usando npm
RUN npm install -g wetty

# Criar um novo usuário 'noejunior299' e definir a senha
RUN useradd -m -s /bin/bash noejunior299
RUN echo 'noejunior299:123456789' | chpasswd

# Adicionar o usuário ao grupo sudo
RUN usermod -aG sudo noejunior299

# Expor a porta do serviço web que o Render usará
EXPOSE 3000

# Copiar o script de inicialização para o contêiner
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Definir o comando para executar na inicialização do contêiner
CMD ["/start.sh"]