FROM centos:centos7.2.1511

ENV GIT_PROJECT gitlab.example.com/hatake_t14/php.git
ENV GIT_USER hatake_t14
ENV GIT_PASS ffffffff

RUN curl -sL https://rpm.nodesource.com/setup_13.x | bash -
RUN yum -y install nodejs

# 言語を日本語に設定
RUN localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
RUN echo 'LANG="ja_JP.UTF-8"' >  /etc/locale.conf
ENV LANG ja_JP.UTF-8

# 日付を日本語に設定
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# git, subversion
RUN yum -y update && yum install -y git | true && yum clean all
RUN mkdir -p /var/www/html/nuxtapp
RUN git config --global http.sslVerify false
RUN git clone https://${GIT_USER}:${GIT_PASS}@${GIT_PROJECT} /var/www/html/php
RUN ln -s /var/www/html/php/laravel-project/nuxtapp /home/nuxtapp
RUN cd /home/nuxtapp && npm install

EXPOSE 80
CMD ["npm", "run", "dev"]
