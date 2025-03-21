1. Создание раздела размером 500 МБ на первом диске
```sh
sudo fdisk -l
sudo fdisk /dev/sda
```
2. Вывод uuid в файл
```sh
sudo blkid /dev/sda1 > /root/uuid.txt
sudo cat /root/uuid.txt
```
3. Создание файловой системы ext4
```sh
sudo mkfs.ext4 -b 4096 /dev/sda1
```
4. Вывод параметров суперблока
```sh
sudo dumpe2fs -h /dev/sda1
```