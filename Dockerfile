# Usando a imagem base do Windows
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Configuração do SSH
RUN powershell -Command \
    Install-WindowsFeature -Name OpenSSH-Server

# Criar usuário
RUN net user noejunior299 123456789 /add
RUN net localgroup administrators noejunior299 /add

# Permitir login remoto
RUN powershell -Command \
    Set-Service -Name ssh-agent -StartupType 'Automatic'; \
    Start-Service ssh-agent

# Expor a porta SSH
EXPOSE 22

# Iniciar o serviço SSH
CMD ["powershell", "-Command", "Start-Service sshd; while ($true) { Start-Sleep -Seconds 3600 }"]
