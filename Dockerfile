FROM babim/debianbase:ssh

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
EXPOSE 22 80 443

# Define default command.
RUN echo "service ssh start" > /startup.sh && echo "hhvm -a" >> /startup.sh && chmod +x /startup.sh
CMD ["/startup.sh"]
