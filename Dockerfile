FROM babim/hhvm:server.ssh

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

ENV LC_ALL en_US.UTF-8
ENV TZ Asia/Ho_Chi_Minh

# Define mountable directories.
VOLUME ["/var/www"]

EXPOSE 9000 22

RUN echo "hhvm --mode=server" > /startup.sh && echo "/usr/sbin/sshd -D" >> /startup.sh && chmod +x /startup.sh
CMD ["/startup.sh"]
