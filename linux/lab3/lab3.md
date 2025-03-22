1. Список подключенных репозиториев
```sh
cat /etc/apt/sources.list
ls -la /etc/apt/sources.list.d/
```
2. Обновление локальных индексов пакетов
```sh
sudo apt update
```
3. Информация о build-essential
```sh
apt show build-essential
```
4. Установка build-essentias
```sh
apt install --simulate build-essential
```
5. Поиск пакета с "clone with a bastard algorithm" в описании
```
```sh
apt-cache search "clone with a bastard algorithm"
```
6. Установка пакета в отдельную директорию
```sh
mkdir -p ~/bastet-source
cd ~/bastet-source
apt-get source bastet
# не было dpkg-dev
sudo apt install dpkg-dev
sudo apt build-dep bastet
```
7. _
```sh
nano Makefile
# редачим makefile
clean make
make
```
8. 123
```sh
make install
ls -la /usr/local/bin/bastet
```
9. 000
```sh

```
10. Все пакеты
```sh
dpkg --list > task10.log
```
11. Зависимости gcc
```sh
apt-cache depends gcc > task11.log
```
12. 0
```sh

```
