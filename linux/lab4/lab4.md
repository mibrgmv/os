## Часть 1
1. Время, затраченное на загрузку системы 
```sh
systemd-analyze
```
2. Запущенные при старте системы сервисы
```sh
systemd-analyze blame
```
3. Список сервисов, предшествующих запуску sshd
```sh
systemctl list-dependencies sshd --before
systemctl list-dependencies sshd --reverse
```
4. Изображение с графиком загрузки системы
```sh
systemd-analyze plot > boot-graph.svg
firefox boot-graph.svg
```
## Часть 2
1. Вывод всех запущенных юнитов сервисов 
```sh
systemctl list-units --type=service --state=running
```
2. Вывод всех юнитов сервисов с автозагрузкой
```sh
systemctl list-unit-files --type=service --state=enabled
```
3. Определение зависимостей сервиса sshd
```sh
systemctl list-dependencies sshd
```
4. Проверка и запуск сервиса cron
```sh
systemctl is-active cron.service
systemctl start cron.service
```
5. Вывод всех параметров юнита cron
```sh
systemctl show cron.service
```
6. Отключение автозагрузки cron
```sh
systemctl disable cron.service
```
## Часть 3
1. Создание сервиса mymsg
```sh
sudo nano /etc/systemd/system/mymsg.service
```
```text
[Unit]
Description=My custom message service
After=network.target
Requires=network.target

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'logger "mymsg service started at $(date)"'

[Install]
WantedBy=multi-user.target
```
2. Настройка автозапуска
```sh
sudo systemctl enable mymsg.service
```
3. Запуск 
```sh
sudo systemctl start mymsg.service
```
## Часть 4
1. Системный журнал
```sh
journalctl
```
2. Сообщения о mymsg 
```sh
journalctl -u mymsg.service
```
3. Сообщения об ошибках
```sh
journalctl -p err
```
4. Размер журнала
```sh
journalctl --disk-usage
```
## Часть 5
1. Создание файла образа вместо раздела
```sh
dd if=/dev/zero of=/mydisk.img bs=1M count=1024
/sbin/mkfs.ext4 /mydisk.img
mkdir -p /mnt/mydata
```
2. Создание юнита
```sh
nano /etc/systemd/system/mnt-mydata.mount
```
```text
[Unit]
Description=Mount mydata loop device

[Mount]
What=/mydisk.img
Where=/mnt/mydata
Type=ext4
Options=loop,defaults

[Install]
WantedBy=multi-user.target
```
3. Проверка
```sh
systemctl daemon-reload
systemctl enable mnt-mydata.mount
systemctl start mnt-mydata.mount
systemctl status mnt-mydata.mount

df -h /mnt/mydata
```
## Часть 6
1.
```sh

```
2. Создание .automount юнита
```sh
sudo nano /etc/systemd/system/mnt-mydata.automount
```
```text
[Unit]
Description=Automount for /mnt/mydata

[Automount]
Where=/mnt/mydata
TimeoutIdleSec=10

[Install]
WantedBy=multi-user.target
```
3. Проверка
```sh
sudo systemctl daemon-reload
sudo systemctl disable mnt-mydata.mount
sudo systemctl stop mnt-mydata.mount
sudo systemctl enable mnt-mydata.automount
sudo systemctl start mnt-mydata.automount

sudo systemctl status mnt-mydata.automount

# обращение к точке монтирования
ls /mnt/mydata
# проверка монтирования 
mount | grep mydata
```
