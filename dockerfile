FROM nginx:stable

COPY ./site/ /usr/share/nginx/html

EXPOSE 3000
