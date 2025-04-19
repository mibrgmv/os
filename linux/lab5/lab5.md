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
11. Запуск `app.py` через `Dockerfile`
### Билд и запуск
```shell
docker build -t flaskapp .
docker run -d -p 5000:5000 --name appname flaskapp
```
### Проверка
```shell
curl -I http://localhost:5000
docker ps -a
```

* Dockerfile
```Dockerfile
FROM python:3.9-alpine

ENV PYTHONUNBUFFERED=1

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
```

* requirements.txt
```txt
flask=3.0.0
```

* .dockerignore

```
__pycache__/
*.py[cod]
*$py.class
*.so
.git
.env
.venv
env/
venv/
ENV/
*.log
.DS_Store
```

12. Подъём `Wordpress` в `docker-compose` 
