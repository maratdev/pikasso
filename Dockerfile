FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Очистим стандартный контент nginx
RUN rm -rf ./*

# Копируем статические файлы сайта в директорию, обслуживаемую nginx
COPY . .

# Nginx по умолчанию слушает 80 порт
EXPOSE 80

