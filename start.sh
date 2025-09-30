#!/bin/bash

# Inicia o ttyd na porta fornecida pelo Render (a variável $PORT).
# O comando 'sudo -u noejunior299 /bin/bash' inicia um shell bash
# diretamente como o usuário 'noejunior299', pulando a etapa de login.
ttyd --port ${PORT:-10000} --check-origin=false sudo -u noejunior299 /bin/bash
