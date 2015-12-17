FROM babim/ubuntubase:ssh

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN echo deb http://dl.hhvm.com/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y hhvm openssh-server && \
    rm -rf /var/lib/apt/lists/*

COPY php.ini /etc/hhvm/php.ini

RUN mkdir /var/run/sshd
# set password root 123456
RUN echo 'root:123456' | chpasswd
# allow root ssh
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22 80
CMD ["hhvm", "-a", "/usr/sbin/sshd", "-D"]
