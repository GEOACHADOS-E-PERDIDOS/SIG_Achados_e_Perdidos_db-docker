#!/bin/bash

echo "Configurando DNS do Docker..."

echo '{
  "dns": ["8.8.8.8", "1.1.1.1"]
}' | sudo tee /etc/docker/daemon.json >/dev/null

echo "Reiniciando Docker..."
sudo systemctl restart docker

echo "Criando imagem e conteiner..."

docker image build -t postgis .

docker run -d \
  --name achados_perdidos \
  -e POSTGRES_DB=gisdb \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  postgis

echo "Concluído."
