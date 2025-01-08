#!/bin/bash

# Construir a imagem Docker
docker build -t ubuntu-ssh .

# Verificar se o container já está em execução e removê-lo
if [ $(docker ps -aq -f name=ubuntu-ssh-container) ]; then
    docker rm -f ubuntu-ssh-container
fi

# Executar o container
docker run -d -p 22:22 --name ubuntu-ssh-container ubuntu-ssh

# Iniciar o serviço SSH
service ssh start

# Obter o IP público do container
PUBLIC_IP=$(curl -s ifconfig.me)

# Exibir instruções de acesso SSH
echo "============================="
echo "Acesse o SSH usando o comando:"
echo "ssh noejunior299@$PUBLIC_IP -p 22"
echo "============================="

# Manter o container em execução
tail -f /dev/null
