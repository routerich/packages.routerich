#!/bin/sh

URL="https://github.com/routerich/packages.routerich/raw/refs/heads/test_2501/targets/test"
DIR="/lib/modules/5.15.167"
DIR_FW="/lib/firmware/mediatek"
modules="batman-adv.ko
cfg80211.ko
mac80211.ko
mt76-connac-lib.ko
mt76.ko
mt7915e.ko"

fws="mt7981_rom_patch.bin
mt7981_wa.bin
mt7981_wm.bin
mt7981_wo.bin"


grep -q 369cd3b56ad9cf95bd112cd6fe72ef5b /usr/lib/opkg/info/kernel.control || {
  echo "Kernel missmatch!"
  exit 1
}

for module in $modules
do
  wget -O "$DIR/$module" "$URL/$module"
done

for fw in $fws
do
  wget -O "$DIR_FW/$fw" "$URL/$fw"
done

wget -O "/tmp/wpad" "$URL/wpad"
cp -f /tmp/wpad /usr/sbin/wpad
chmod +x /usr/sbin/wpad

wget -O "/lib/netifd/hostapd.sh" "$URL/hostapd.sh"

echo wed off
echo mt7915e > /etc/modules.d/mt7915e
