# Этап 1: минификация HTML и CSS
FROM node:20-alpine AS builder

WORKDIR /app
COPY . .

# Минификация HTML (включая встроенные стили и скрипты)
RUN npx --yes html-minifier-terser \
  --collapse-whitespace \
  --remove-comments \
  --minify-css true \
  --minify-js true \
  --conservative-collapse \
  index.html -o index.min.html && mv index.min.html index.html

# Минификация CSS
RUN npx --yes clean-css-cli -o css/style.min.css css/style.css && mv css/style.min.css css/style.css

# Этап 2: финальный образ с nginx
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app .

EXPOSE 80

