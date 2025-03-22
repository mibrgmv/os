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
```