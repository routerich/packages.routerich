# Routerich Packages

```
grep -q routerich /etc/opkg/customfeeds.conf || echo src/gz routerich https://github.com/routerich/packages.routerich/raw/23.05.4/routerich >> /etc/opkg/customfeeds.conf
wget https://github.com/routerich/packages.routerich/raw/main/routerich.pab -O /tmp/routerich.pub && opkg-key add /tmp/routerich.pub
opkg update
```
