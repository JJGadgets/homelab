#!/usr/bin/env bash
#cd ~/dev/homelab/homelab/talos-1
#talhelper genconfig
#
#export TALOSCONFIG=~/dev/homelab/homelab/talos-1/clusterconfig/talosconfig

talosctl config node "10.250.2.220"; talosctl config endpoint 10.250.2.220 10.250.2.221 10.250.2.222 10.250.2.253

echo Applying master..
talosctl apply-config --nodes 10.250.2.220 --file clusterconfig/homelab-talos-1-homelab-talos-1-controlplane-0.yaml
talosctl apply-config --nodes 10.250.2.221 --file clusterconfig/homelab-talos-1-homelab-talos-1-controlplane-1.yaml
talosctl apply-config --nodes 10.250.2.222 --file clusterconfig/homelab-talos-1-homelab-talos-1-controlplane-2.yaml

echo Applying worker..
talosctl apply-config --nodes 10.250.2.230 --file clusterconfig/homelab-talos-1-homelab-talos-1-worker-0.yaml
talosctl apply-config --nodes 10.250.2.231 --file clusterconfig/homelab-talos-1-homelab-talos-1-worker-1.yaml
talosctl apply-config --nodes 10.250.2.232 --file clusterconfig/homelab-talos-1-homelab-talos-1-worker-2.yaml

echo Sleep..
sleep 120

echo Running bootstrap..
talosctl bootstrap

echo Sleep..
sleep 180

talosctl kubeconfig -f .

#export KUBECONFIG=$(pwd)/kubeconfig
#echo kubectl get no
#kubectl get no
