FROM babim/hhvm:server

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN apt-get install openssh-server -y

RUN mkdir /var/run/sshd
# set password root is root
RUN echo 'root:root' | chpasswd
# allow root ssh
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

ENV LC_ALL en_US.UTF-8
EXPOSE 9000 22
CMD ["hhvm", "--mode=server"]
CMD ["/usr/sbin/sshd", "-D"]
