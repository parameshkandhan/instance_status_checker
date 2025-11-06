FROM amazonlinux:2023

RUN yum update -y && \
    yum install -y httpd procps-ng && \
    yum clean all
RUN yum install -y  httpd

COPY index.sh /home/ec2-user/docker/index.sh
RUN chmod +x /home/ec2-user/docker/index.sh

CMD ["/bin/bash", "-c", "/home/ec2-user/docker/index.sh && httpd -DFOREGROUND"]


