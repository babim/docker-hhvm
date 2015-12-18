FROM babim/hhvm

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

ENV LC_ALL en_US.UTF-8
EXPOSE 9000 22
CMD ["hhvm", "--mode=server", "/usr/sbin/sshd", "-D"]
