# vim: ft=yaml
# Custom Pillar Data for python

python:
  enabled: true
  version: 3
  from_pkgs: false
  modules:
    - pcapy
    - simpledaemon
  deps:
    - libpcap0.8-dev
