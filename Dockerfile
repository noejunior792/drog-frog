# Usar a imagem base do Ubuntu 20.04
FROM ubuntu:20.04

# Evitar prompts interativos durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências: sudo, curl e o utilitário de login
RUN apt-get update && apt-get install -y sudo curl login

# Baixar e instalar o ttyd
RUN curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.4/ttyd.x86_64 -o /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd

# Criar um novo usuário 'noejunior299' e definir a senha
RUN useradd -m -s /bin/bash noejunior299
RUN echo 'noejunior299:123456789' | chpasswd

# Adicionar o usuário ao grupo sudo
RUN usermod -aG sudo noejunior299

# Expor a porta do serviço web que o Render usará (Render define a variável $PORT)
EXPOSE 10000

# Copiar o script de inicialização para o contêiner
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Definir o comando para executar na inicialização do contêiner
CMD ["/start.sh"]
