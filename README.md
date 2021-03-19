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

Parámetros systemctl
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf ; sysctl -p

Hay que modificar las IPs públicas para que tengan el nombre del master 
mirar ejemplos en los stack.yaml


Montar Grafana + InfluxDB 
-------------------------

mkdir -p /srv/docker/monitor/volumes/grafana
mkdir -p /srv/docker/monitor/volumes/influxdb

chmod 777 /srv/docker/monitor/volumes/grafana
chmod 777 /srv/docker/monitor/volumes/influxdb 

Montar bien permisos! 

Hay que modificar las IPs públicas para que tengan el nombre del master
mirar ejemplos en los docker-compose.yml
docker stack deploy -c docker-compose.yaml monitor
 
Montar Elasticsearch + Kibana + Logstage + Logspout 

mkdir -p /srv/docker/elk-data/logstash/config
mkdir -p /srv/docker/elk-data/elasticsearch/data/nodes
chown -R 1000 /srv/docker/elk-data/elasticsearch 

cd logspout-elk
env REMOTE_MOUNT="/srv/docker" STACK_NAME="elk-data" docker stack deploy -c docker-compose.yaml logspout-elk

.

