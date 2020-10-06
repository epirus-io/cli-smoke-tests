#!/bin/bash
set -e
set -v
echo "Docker username: $DOCKER_USERNAME"
echo "$DOCKER_PASSWORD" | docker login registry.gitlab.com -u "$DOCKER_USERNAME" --password-stdin

if [ -f "C:\\windows\\system32\\drivers\\etc\\hosts" ]; then
  choco install -y jdk8 docker-compose
  docker-compose up -d
  export JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_231"
  powershell -executionpolicy bypass "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/epirus-io/epirus-installer/master/installer.ps1'))"
  chmod +x ~/.epirus/*/bin/epirus.bat
  ~/.epirus/*/bin/epirus.bat version
  exit 0
fi
docker-compose up -d
curl -L get.epirus.io | sh
echo "Sourcing epirus source script"
source $HOME/.epirus/source.sh
echo "System path:"
echo $PATH
./test.sh
