#!/bin/bash

# Inicia o ttyd na porta fornecida pelo Render (a variável $PORT).
# A opção --check-origin=false é adicionada para tentar resolver problemas de conexão por trás de proxies.
ttyd --port ${PORT:-10000} --check-origin=false login