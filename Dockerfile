FROM babim/hhvm:server

EXPOSE 9000

# Define mountable directories.
VOLUME ["/var/www"]

CMD ["hhvm", "--mode=server"]
