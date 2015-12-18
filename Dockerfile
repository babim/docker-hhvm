FROM babim/debianbase

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo 'deb http://dl.hhvm.com/debian jessie main' > /etc/apt/sources.list.d/hhvm.list
RUN apt-get update && \
    apt-get install -y hhvm && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup
    
COPY php.ini /etc/hhvm/php.ini

ENV LC_ALL C.UTF-8

CMD ["hhvm", "-a"]
