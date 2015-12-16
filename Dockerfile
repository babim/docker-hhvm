FROM babim/ubuntubase:ssh

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

EXPOSE 9000

CMD ["hhvm", "--mode=server"]
