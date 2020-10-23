apt install -y git
curl https://get.docker.com | sudo bash

mkdir -p /srv/docker
#	Configurar NFS
echo 'maquina-1:/srv/nfs /srv/docker nfs defaults,nfsvers=3 0 0' >> /etc/fstab
apt install -y nfs-common
echo '/srv/nfs 10.132.0.0/24(rw,no_root_squash,no_subtree_check)' >> /etc/exports
mount -a

/srv/docker/join.sh


