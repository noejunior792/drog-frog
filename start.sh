#!/bin/bash

# Iniciar o serviço SSH em segundo plano
/usr/sbin/sshd

# Iniciar um servidor web simples para manter o serviço ativo para o Render
# Ele servirá o conteúdo do diretório raiz na porta 10000
echo "Iniciando servidor web na porta 10000 para manter o serviço ativo..."
python3 -m http.server --directory / 10000