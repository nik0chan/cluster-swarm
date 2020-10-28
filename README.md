# cluster-swarm

Montar un nodo servidor (Base Debian)
-------------------------------------

```
apt-get install git -y 
git clone http://github.com/nik0chan/cluster-swarm
export NFS_CLIENTS=<clientes nfs>
cluster-swarm/run-master.sh
```

```
apt-get install git -y 
export NFS_SERVER=<servidor nfs>
git clone http://github.com/nik0chan/cluster-swarm
cluster-swarm/run-worker.sh
```

Montar un nodo servidor (Base Centos)
-------------------------------------
```
yum install git -y 
git clone http://github.com/nik0chan/cluster-swarm
export NFS_CLIENTS="<clientes nfs>"
cluster-swarm/run-master.sh
```

```
yum install git -y 
export NFS_SERVER="<servidor nfs>"
git clone http://github.com/nik0chan/cluster-swarm
cluster-swarm/run-worker.sh

Montar elk-logspout 
-------------------

Existen una serie de requisitos: 

export REMOTE_MOUNT=/srv/docker

Directorios 
mkdir -p /srv/docker/elasticsearch/data
mkdir -p /srv/docker/logstash/config
cp logspout-elk/files/logstash.conf /srv/docker/logstash/config
chown 1000:root /srv/docker/elasticsearch/data -R
chmod 750 /srv/docker/elasticsearch/data

