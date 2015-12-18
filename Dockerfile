FROM babim/debianbase

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

EXPOSE 9000

CMD ["hhvm", "--mode=server"]
ENV LC_ALL C.UTF-8
