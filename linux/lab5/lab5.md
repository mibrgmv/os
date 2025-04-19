4. -
```shell
cat /sys/fs/cgroup/cgroup.controllers

sudo mkdir /sys/fs/cgroup/cpu_group

echo 0 | sudo tee /sys/fs/cgroup/cpu_group/cpuset.cpus

sudo cgexec -g cpuset:cpu_group top

```

5. -
```shell
chmod +x cpu_quota_manager.sh

while true; do :; done &
TEST_PID=$!
sudo ./cpu_quota_manager.sh $TEST_PID

cat /sys/fs/cgroup/cpu_quota_*/cpu.max
```
11. Запуск `app.py` через `Dockerfile` \\
Билд и запуск
```shell
docker build -t flaskapp .
docker run -d -p 5000:5000 --name appname flaskapp
```
Проверка
```shell
curl -I http://localhost:5000
docker ps -a
```
Файлы:
- [Dockerfile](./Dockerfile)
- [requirements.txt](./requirements.txt)
- [.dockerignore](./.dockerignore)

12. Подъём `Wordpress` в `docker-compose` 
