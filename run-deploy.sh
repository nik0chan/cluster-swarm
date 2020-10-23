#!/bin/bash

IP1=$(getent hosts instance-1 | awk '{print $1}')
IP2=$(getent hosts instance-2 | awk '{print $1}')
IP3=$(getent hosts instance-3 | awk '{print $1}')
export IP1 IP2 IP3
export REMOTE_MOUNT="/srv/docker/data"

cd /srv/docker/swarm-cluster-example
docker stack deploy -c traefik/stack.yaml traefik
docker stack deploy -c portainer/stack.yaml portainer
docker stack deploy -c consul-cluster/stack.yaml consul-cluster
docker stack deploy -c comptador/stack.yaml comptador
