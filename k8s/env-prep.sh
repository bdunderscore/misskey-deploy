#!/bin/bash

#set -euxo pipefail

helm repo add ot-helm https://ot-container-kit.github.io/helm-charts/
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add cloudflare https://cloudflare.github.io/helm-charts

helm repo update

#helm install operator-postgres --create-namespace -n pg-operators postgres-operator-examples/helm/install
#helm install redis-operator ot-helm/redis-operator --create-namespace -n ot-operators --version 0.14.0
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

helm install kps -n kps prometheus-community/kube-prometheus-stack  --create-namespace --values kps-values.yaml
#helm install argo -n argo cloudflare/argo-tunnel --create-namespace

#kubectl apply -k https://github.com/adyanth/cloudflare-operator/config/default

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace