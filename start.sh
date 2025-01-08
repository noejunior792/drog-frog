#!/bin/bash

# Obter o IP público do container
PUBLIC_IP=$(curl -s ifconfig.me)

# Exibir instruções de acesso SSH
echo "============================="
echo "Acesse o SSH usando o comando:"
echo "ssh noejunior299@$PUBLIC_IP -p 22"
echo "============================="

# Iniciar o servidor SSH em modo foreground
/usr/sbin/sshd -D
