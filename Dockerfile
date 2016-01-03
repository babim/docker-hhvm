FROM babim/hhvm:server.ssh

# Define mountable directories.
VOLUME ["/var/www"]

EXPOSE 9000 22

RUN echo "service ssh start" > /startup.sh && echo "hhvm --mode=server" >> /startup.sh && chmod +x /startup.sh
CMD ["/startup.sh"]
