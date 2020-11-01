#!/bin/sh 

PUBLIC_IP=$(curl ifconfig.co)
sed -i -e "s/replaceme/$PUBLIC_IP/g" /srv/docker/monitor/stack.yaml
sed -i -e "s/replaceme/$PUBLIC_IP/g" /srv/docker/portainer/stack.yaml

docker network create --driver overlay proxy
docker network create --driver overlay portainer_agent

docker stack deploy -c /srv/docker/monitor/stack.yaml monitor
docker stack deploy -c /srv/docker/portainer/stack.yaml portainer
docker stack deploy -c /srv/docker/traefik/stack.yaml traefik