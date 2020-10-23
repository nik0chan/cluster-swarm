
Logspout + ELK log collection for all running dockers.

Kibana accessible through Traefik. No ports binded to the swarm, feel free to add ports section.

Configure .env first!

IMPORTANT:
  - copy logstash config file inside logstash configuration's volume.
  - Increase Kernel's vm.max_map_count: sysctl -w vm.max_map_count=262144, ES needs it.
  - Adapt Logspout environment variables: https://github.com/gliderlabs/logspout/

You must create some directories + networks first.

- stack.yaml : single instance ELK+Logspout Docker log collector

With little changes you can open your Elasticsearch and/or logstash to other docker stacks or your network or modify those services to provide a clustered environment.
