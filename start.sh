#!/bin/bash

# Inicia o Wetty na porta fornecida pelo Render ($PORT, com padrão 3000).
# --base / : Garante que o Wetty funcione na raiz da URL.
# -- sudo ... : Comando para iniciar o shell diretamente como o usuário.
wetty --port ${PORT:-3000} --base / -- sudo -u noejunior299 /bin/bash