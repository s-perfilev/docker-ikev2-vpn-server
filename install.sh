#!/bin/bash

#add tor repo
cat <<'EOT' >> /etc/apt/sources.list.d/tor.list
deb http://deb.torproject.org/torproject.org trusty main
deb-src http://deb.torproject.org/torproject.org trusty main
EOT

#gpg
/usr/bin/gpg --keyserver keys.gnupg.net --recv 886DDD89
/usr/bin/gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

#install tor
apt-get update -qq
apt-get install -qy tor

#tor config

cat <<'EOT' >> /etc/tor/torrc
VirtualAddrNetworkIPv4 10.8.0.0/10
AutomapHostsOnResolve 1
TransPort 9040
TransListenAddress 1.1.1.1
EOT


