#!/bin/bash

k="kubectl"

kubectl create namespace play

# Better way to make sure containers start up in order is to use InitContainers

kubectl create -f db-secret.yaml -n play
kubectl create configmap app-config --from-file=./config.yaml -n play

kubectl create -f db-storage.yaml -n play
kubectl create -f deploy-db.yaml -n play
kubectl create -f db-service.yaml -n play

kubectl create -f nodeport-service.yaml -n play

kubectl create -f deploy-webapp.yaml -n play
