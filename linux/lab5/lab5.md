11. Запуск `app.py` через `Dockerfile`
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
```shell
docker-compose up -d
```

Проверка
```shell
curl -I http://localhost:2079
docker ps -a
docker logs mysql
docker logs wordpress
```
