#!/bin/bash
set -e
set -v
echo "Docker username: $DOCKER_USERNAME"
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker-compose up -d

if [ -f "C:\\windows\\system32\\drivers\\etc\\hosts" ]; then
  choco install -y jdk8
  export JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_211"
  powershell -executionpolicy bypass .\\installer.ps1
  chmod +x ~/.epirus/*/bin/epirus.bat

  ~/.epirus/*/bin/epirus.bat version
  exit 0
fi
curl -L get.epirus.io | sh
echo "Sourcing epirus source script"
source $HOME/.epirus/source.sh
echo "Content of bashrc:"
cat ~/.bashrc
echo "System path:"
echo $PATH
./test.sh
