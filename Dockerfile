FROM babim/hhvm:server.ssh

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

ENV LC_ALL en_US.UTF-8
ENV TZ Asia/Ho_Chi_Minh

# Define mountable directories.
VOLUME ["/var/www"]

EXPOSE 9000 22
CMD ["hhvm", "--mode=server"]
CMD ["/usr/sbin/sshd", "-D"]
