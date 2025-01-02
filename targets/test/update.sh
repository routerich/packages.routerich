#!/bin/sh

URL="https://github.com/routerich/packages.routerich/raw/refs/heads/test_3012/targets/test"
DIR="/lib/modules/5.15.167"
modules="batman-adv.ko
cfg80211.ko
mac80211.ko
mt76-connac-lib.ko
mt76.ko
mt7915e.ko"

grep -q 369cd3b56ad9cf95bd112cd6fe72ef5b /usr/lib/opkg/info/kernel.control || {
  echo "Kernel missmatch!"
  exit 1
}

for module in $modules
do
  wget -O "$DIR/$module" "$URL/$module"
done

wget -O "/usr/sbin/wpad" "$URL/wpad"
chmod +x /usr/sbin/wpad

echo wed off
echo mt7915e > /etc/modules.d/mt7915e
