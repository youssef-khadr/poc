FROM centos:latest
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install nginx
ADD index.html /usr/share/nginx/html/index.html
EXPOSE 80/tcp
CMD ["nginx", "-g daemon off;"]