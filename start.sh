#!/bin/bash

# Inicia o ttyd na porta fornecida pelo Render (a variável $PORT).
# Isso apresentará um prompt de login do sistema no terminal web.
ttyd --port ${PORT:-10000} login
