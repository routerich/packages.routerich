#!/bin/sh

URL="https://github.com/routerich/packages.routerich/raw/refs/heads/test_3012/targets/test"
DIR="/lib/modules/5.15.167"
modules="cfg80211.ko
mac80211.ko
mt76-connac-lib.ko
mt76.ko
mt7915e.ko"

for module in $modules
do
  wget -O "$DIR/$module" "$URL/$module"
done
