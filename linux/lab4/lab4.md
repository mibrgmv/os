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
After=network.service
Requires=network.service

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'logger "mymsg service started at $(date)"'
RemainAfterExit=yes

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
1.
```sh

```
2.
```sh

```
3.
```sh

```
4.
```sh

```
## Часть 5
1.
```sh

```
2.
```sh

```
3.
```sh

```
## Часть 6
1.
```sh

```
2.
```sh

```
3.
```sh

```
