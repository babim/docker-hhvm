FROM babim/debianbase:ssh

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN	wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN	echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y hhvm openssh-server && \
    rm -rf /var/lib/apt/lists/*

COPY php.ini /etc/hhvm/php.ini

RUN mkdir /var/run/sshd
# set password root is root
RUN echo 'root:root' | chpasswd
# allow root ssh
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile" LC_ALL C.UTF-8
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22 80
CMD ["hhvm", "-a", "/usr/sbin/sshd", "-D"]
