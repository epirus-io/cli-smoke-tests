from ubuntu:latest

RUN curl -L get.epirus.io && source ~/.epirus/source.sh 
COPY cp .config ~/.epirus/