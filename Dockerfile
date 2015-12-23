FROM babim/debianbase:ssh

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN	wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo 'deb http://dl.hhvm.com/debian jessie main' > /etc/apt/sources.list.d/hhvm.list
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y hhvm && \
    rm -rf /var/lib/apt/lists/*

COPY php.ini /etc/hhvm/php.ini

# Define working directory.
WORKDIR /var/www

# Define mountable directories.
VOLUME ["/var/www"]

ENV LC_ALL C.UTF-8
ENV TZ Asia/Ho_Chi_Minh
EXPOSE 22 80 443
CMD ["hhvm", "-a"]
CMD ["/usr/sbin/sshd", "-D"]
