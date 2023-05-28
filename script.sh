#!/bin/bash

echo "Criando as imagens....."

docker build -t vinicius/projeto-backend:1.0 backend/.
docker build -t vinicius/prjeto-database:1.0 database/.

echo "Realizando push das imagens...."

docker push vinicius/projeto-backend:1.0
docker push vinicius/projeto-database:1.0

echo "Criando Serviços do Cluster K8s..."

kubectl apply -f ./services.yml

echo "Criando os Deployments..."

kubectl apply -f ./deployment.yml