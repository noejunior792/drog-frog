#!/bin/bash

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
