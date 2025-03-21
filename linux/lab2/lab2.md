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
5. Настройка автоматической проверки
```sh
sudo tune2fs -c 2 -i 2m /dev/sda1
```
6. Монтирование в каталог
```sh
sudo mkdir -p /mnt/newdisk
sudo mount /dev/sda1 /mnt/newdisk
```
7. Создание ссылки на смонтированную фс
```sh
sudo ln -s /mnt/newdisk /root/newdisk_link
```
8. Создание каталога в смонтированной фс
```sh
sudo mkdir /mnt/newdisk/mydir
```
9. Настройка автомонтирования и проверка
```sh
UUID=$(sudo blkid -s UUID -o value /dev/sda1)
echo "UUID=$UUID /mnt/newdisk ext4 defaults,noexec,noatime 0 2" | sudo tee -a /etc/fstab

mount | grep newdisk
df -h | grep newdisk
```
10. Увеличение размера и проверка
```sh
sudo umount /mnt/newdisk
sudo e2fsck -f /dev/sda1
sudo fdisk /dev/sda
sudo resize2fs /dev/sda1
sudo mount /dev/sda1 /mnt/newdisk

df -h /mnt/newdisk
```
11. Проверка на наличие ошибок
```sh
sudo e2fsck -n /dev/sda1
```
12. Содание нового раздела 12 Мбайт и перенос журнала 
```sh
sudo fdisk /dev/sda

sudo umount /mnt/newdisk
sudo tune2fs -O ^has_journal /dev/sda1
sudo tune2fs -j -J device=/dev/sda2 /dev/sda1
sudo mount /dev/sda1 /mnt/newdisk
```
13. Создание разделов Linux LVM на 2 и 3 дисках
```sh
sudo fdisk /dev/sdb
# n p 1 'enter' 'enter' t 8e w

sudo fdisk /dev/sdc
# n p 1 'enter' 'enter' t 8e w

# Инициализируем разделы для LVM
sudo pvcreate /dev/sdb1 /dev/sdc1
```
14. Создание чередующегося тома и фс ext4
```sh
# Создаем группу томов
sudo vgcreate vg01 /dev/sdb1 /dev/sdc1
# Создаем логический том, используя все доступное пространство
sudo lvcreate -l 100%FREE -n lvol01 vg01 -i 2
# Создаем файловую систему ext4
sudo mkfs.ext4 /dev/vg01/lvol01
```
15. Автомонтирование
```sh
# Создаем точку монтирования и монтируем том
sudo mkdir -p /mnt/vol01
sudo mount /dev/vg01/lvol01 /mnt/vol01
# Автомонтирование
echo "/dev/vg01/lvol01 /mnt/vol01 ext4 defaults 0 2" | sudo tee -a /etc/fstab
```
16. Получение информации о дисках, группах и томах
```sh
sudo pvdisplay
sudo vgdisplay
sudo lvdisplay
```
17. Расширение раздела на новый диск
```sh
sudo fdisk /dev/sdd
# n p 1 'enter' 'enter' t 8e w

sudo pvcreate /dev/sde1
sudo vgextend vg01 /dev/sde1
sudo lvextend -l +100%FREE /dev/vg01/lvol01
```
18. Расширение фс на новый диск
```sh
sudo resize2fs /dev/vg01/lvol01
```
19. Получение обновленной информации
```sh
sudo pvdisplay
sudo vgdisplay
sudo lvdisplay
```
# server
20. NFS сервер
```sh
sudo apt install nfs-kernel-server
sudo systemctl enable nfs-server
sudo systemctl start nfs-server
sudo systemctl status nfs-server
```
21. Настройка экспорта
```sh
NETWORK=$(ip route | grep -v default | grep -v 'linkdown' | awk '{print $1}' | grep '/')
echo "/mnt/vol01 ${NETWORK}(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports
sudo exportfs -ra
sudo exportfs -v
```
# client
22. 
```sh
sudo apt update
sudo apt install nfs-common
sudo mkdir -p /var/remotenfs
```