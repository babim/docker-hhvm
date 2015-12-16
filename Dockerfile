FROM babim/ubuntubase:ssh

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN echo deb http://dl.hhvm.com/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y hhvm && \
    rm -rf /var/lib/apt/lists/*

COPY php.ini /etc/hhvm/php.ini

CMD ["hhvm", "-a"]
