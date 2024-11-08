FROM nginx:latest
LABEL authors="jaiken"

# 将项目根目录下dist文件夹下的所有文件复制到镜像中 /usr/share/nginx/html/ 目录下
COPY ./dist /usr/share/nginx/html/dist
COPY default.conf /etc/nginx/conf.d/default.conf
