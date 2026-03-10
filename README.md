# Сайт «ПИКАССО» — запуск в Docker

Проект — статичный лендинг, который разворачивается через nginx в Docker.

## Сборка Docker-образа

docker build -t pikasso-site .

## Запуск контейнера

docker run --rm -p 8080:80 pikasso-site

После запуска сайт будет доступен по адресу `http://localhost:8080`.

