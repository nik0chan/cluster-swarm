# cluster-swarm

Montar un nodo servidor
-----------------------

```
apt-get install git -y 
git clone http://github.com/nik0chan/cluster-swarm
export NFS_CLIENTS="<clientes nfs>"
cluster-swarm/run-master.sh
```

```
apt-get install git -y 
export NFS_SERVER="<servidor nfs>"
git clone http://github.com/nik0chan/cluster-swarm
cluster-swarm/run-worker.sh
```
