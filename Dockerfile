FROM centos:7
MAINTAINER Alexey Vinogradov <mail@alexsakh.ru>

# upgrade the container
RUN yum update -y

#install supervisor
RUN yum install supervisor -y
RUN mkdir -p /var/log/supervisor
VOLUME ["/var/log/supervisor"]
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# install nginx
RUN yum install nginx -y
VOLUME ["/var/cache/nginx"]
VOLUME ["/var/log/nginx"]
EXPOSE 80 443

# clean up
RUN yum clean cache

# set container entrypoints
ENTRYPOINT ["/bin/bash","-c"]

CMD ["/usr/bin/supervisord"]
