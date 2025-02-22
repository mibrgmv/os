#!/bin/bash

awk -F '{print "user: " $1 ", id: " $3}' /etc/passwd >> work3.log
cut -d: -f1 /etc/group | paste -sd, >> work3.log

useradd -m u1
echo "123" | passwd u1 --stdin

groupadd g1
usermod -a -G g1 u1
id u1 >> work3.log

useradd -m myuser
usermod -a -G g1 myuser

getent group g1 | cut -d: -f4 | paste -sd, >> work3.log

sudo usermod -s /usr/bin/mc u1

useradd -m u2
echo "321" | passwd u2 --stdin

mkdir /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log

chown u1:g1 /home/test13
chmod 750 /home/test13
chown -R u1:g1 /home/test13
chmod 640 /home/test13/work3-1.log
chmod 640 /home/test13/work3-2.log

mkdir -p /home/test14
sudo chown u1:u1 /home/test14
chmod 1777 /home/test14

cp /bin/nano /home/test14
chmod 755 /home/test14/nano

mkdir -p /home/test15
echo "secret content" > /home/test15/secret
chmod 444 /home/test15/secret
chmod 111 /home/test15

echo "u1 ALL=(root) /usr/bin/passwd" > "etc/sudoers.d/u1"
chmod 440 /etc/sudoers.d/u1
