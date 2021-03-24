#!/bin/zsh

# start kubernetes cluster with custom config.
kind create cluster --config=kind-config.yaml
kubectl cluster-info --context kind-kind

# setup helm repository
helm repo add cilium https://helm.cilium.io/

# Preload the cilium image into each worker node in the kind cluster.
docker pull cilium/cilium:v1.9.5
kind load docker-image cilium/cilium:v1.9.5

# install
helm install cilium cilium/cilium --version 1.9.5 \
   --namespace kube-system \
   --set nodeinit.enabled=true \
   --set kubeProxyReplacement=partial \
   --set hostServices.enabled=false \
   --set externalIPs.enabled=true \
   --set nodePort.enabled=true \
   --set hostPort.enabled=true \
   --set bpf.masquerade=false \
   --set image.pullPolicy=IfNotPresent \
   --set ipam.mode=kubernetes
