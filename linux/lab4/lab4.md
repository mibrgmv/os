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
4.
```sh
systemd-analyze plot > boot-graph.svg
```
## Часть 2
1.
```sh
systemctl list-units --type=service --state=running
```
2.
```sh
systemctl list-unit-files --type=service --state=enabled
```
3.
```sh
systemctl list-dependencies sshd
```
4.
```sh
systemctl is-active cron.service
systemctl start cron.service
```
5.
```sh
systemctl show cron.service
```
6.
```sh
systemctl disable cron.service
```
## Часть 3
1.
```sh

```
2.
```sh

```
3.
```sh

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
