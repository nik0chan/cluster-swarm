#!/bin/bash

apt install -y git
curl https://get.docker.com | sudo bash

mkdir -p /srv/docker
# Configurar NFS
[[ -z '${NFS_SERVER}' ]]; echo "$NFS_SERVER:/srv/nfs /srv/docker nfs defaults,nfsvers=3 0 0" >> /etc/fstab

apt install -y nfs-kernel-server
[[ -z "${NFS_CLIENTS}" ]]; echo "/srv/docker $NFS_CLIENTS(rw,no_root_squash,no_subtree_check)" >> /etc/exports
echo systemctl start nfs-kernel-server
echo mount -a

docker swarm init
docker swarm join-token manager|grep join  > /srv/docker/join.sh
chmod +x !$

cd /srv/docker
git clone https://github.com/nik0chan/cluster-swarm

docker network create proxy -d overlay
docker network create portainer_agent -d overlay
