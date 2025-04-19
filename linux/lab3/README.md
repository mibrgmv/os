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
12. Пакеты которые требуют libgpm2
```sh
apt-cache rdepends libgpm2 > task12.log
```
13. Создание localrepo и установка пакетов
```sh
mkdir /home/localrepo
cd /home/localrepo
dpkg-scanpackages --multiversion . /dev/null > Packages
echo "deb [trusted=yes] file:/home/localrepo ./" | sudo tee /etc/apt/sources.list.d/localrepo.list

sudo wget http://snapshot.debian.org/archive/debian/20220717T032247Z/pool/main/h/htop/htop_3.2.1-1_arm64.deb
sudo wget http://snapshot.debian.org/archive/debian/20210731T155743Z/pool/main/h/htop/htop_3.0.5-7_arm64.deb
sudo wget http://snapshot.debian.org/archive/debian/20201031T033955Z/pool/main/h/htop/htop_3.0.2-1_arm64.deb
sudo wget http://snapshot.debian.org/archive/debian/20200721T042305Z/pool/main/h/htop/htop_3.0.1-1_arm64.deb
sudo wget http://snapshot.debian.org/archive/debian/20190908T034248Z/pool/main/h/htop/htop_2.2.0-1+b1_arm64.deb
```
14. Release
```sh
nano Release
# Origin: My Local Repo
# Label: My Local Repo
# Suite: stable
# Version: 1.0
# Codename: myrepo
# Architectures: amd64
# Components: main
# Description: My local APT repository
```
15. Обновление кэша apt
```sh
apt update
```
16. Список реп
```sh

```
17. Вывод информации о пакетах
```sh
apt-cache madison htop > task16.log
```
18. Установка предпоследней версии
```sh

```
19. newnano
```sh
# распаковываем пакет в отдельной директории
apt download nano
mkdir nano-mod
cd nano-mod
dpkg-deb -R ../nano-*.deb .

# создаем ссылку
mkdir -p ./usr/local/bin
ln -s /usr/bin/nano usr/local/bin/newnano

cd ..
dpkg-deb -b nano-mod nano-mod.deb
dpkg -i nano-mod.deb

# проверка
newnano --version
```

