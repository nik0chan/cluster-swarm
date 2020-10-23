
Please, copy files/telegraf.conf to the host's /etc/telegraf/telegraf.conf path before launching this stack. It will reconfigure that file so hostname matches the host server instead of the ugly Docker random hostname, getting nicer dashboards afterwards where your hostnames make sense. Use kpeiruza/telegraf until node.hostname can be used to provide ENV vars in a Stack (still pending...)

Settings in .env, migrate to stack.yaml and/or docker secrets.

Current image for telegraf has been modified to pick the host's hostname from the docker engine, not from the container, so we get the names of our servers instead of those from our docker-generated random hostnames, making things way nicer on Grafana.

At current time, docker stack doesn't support any variable providing the hostname of the host docker server. Please, update with a standard telegraf whenever possible.

