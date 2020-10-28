#!/bin/sh 

PUBLIC_IP=$(curl ifconfig.co)
sed -i -e "s/replaceme/$PUBLIC_IP/g" /srv/docker/portainer/stack.yaml

docker network create --driver overlay proxy
docker network create --driver overlay portainer_agent

docker stack deploy -c /srv/docker/traefik/stack.yaml traefik
docker stack deploy -c /srv/docker/portainer/stack.yaml portainer
docker stack deploy -c /srv/docker/wordpress/stack.yaml wordpress

