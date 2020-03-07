FROM centos:centos7.2.1511

ENV GIT_PROJECT https://gitlab.example.com/hatake_t14/php.git

##################
# apache
COPY ./apache/apache-install.sh /root/apache-install.sh
RUN /root/apache-install.sh
# Copy apache vhost file to proxy php requests to php-fpm container
COPY ./apache/Includes /opt/rh/httpd24/root/etc/httpd/Includes
# SSL通信する際はここを有効にする
# COPY ./ssl /etc/httpd/ssl
COPY ./apache/apache-build.sh /root/apache-build.sh
RUN /root/apache-build.sh
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/rh/httpd24/root/usr/lib64
ENV PATH $PATH:/opt/rh/httpd24/root/usr/sbin
EXPOSE 80

##################
# PHP7
ENV PATH $PATH:/opt/remi/php72/root/usr/sbin:/opt/remi/php72/root/usr/bin:/usr/local/bin
COPY ./php/php7/php7-install.sh /root/php7-install.sh
RUN /root/php7-install.sh
ADD ./php/php7/php.ini /etc/opt/remi/php72/php.ini
ADD ./php/php7/php-fpm.conf /etc/opt/remi/php72/php-fpm.conf
ADD ./php/php7/php-fpm.d/ /etc/opt/remi/php72/php-fpm.d
ADD ./php/php7/dns-regist.sh /usr/local/bin/
COPY ./php/php7/php7-build.sh /root/php7-build.sh
RUN /root/php7-build.sh

##################
# PHP5
ENV PATH $PATH:/opt/remi/php56/root/usr/sbin:/opt/remi/php56/root/usr/bin:/usr/local/bin
COPY ./php/php5/php5-install.sh /root/php5-install.sh
RUN /root/php5-install.sh
ADD ./php/php5/php.ini /etc/opt/remi/php56/php.ini
ADD ./php/php5/php-fpm.conf /etc/opt/remi/php56/php-fpm.conf
ADD ./php/php5/php-fpm.d/ /etc/opt/remi/php56/php-fpm.d
ADD ./php/php5/dns-regist.sh /usr/local/bin/
COPY ./php/php5/php5-build.sh /root/php5-build.sh
RUN /root/php5-build.sh

##################
# supervisor
RUN yum install -y python-setuptools | true && \
  easy_install supervisor
RUN mkdir -p /var/lib/supervisor
RUN mkdir -p /var/log/supervisord
RUN chmod -R 775 /var/lib/supervisor
RUN chmod -R 775 /var/log/supervisord
COPY ./supervisord/supervisord.conf /etc/supervisord.conf

##################
# その他設定

# git, subversion
RUN yum -y update && yum install -y subversion git | true && yum clean all
RUN mkdir -p /var/www/html/php-example
RUN git clone $GIT_PROJECT /var/www/html/php-example
RUN ln -s /var/www/html/php-example/laravel-project /home/laravel-project
RUN ln -s /var/www/html/php-example/example1.co.jp /home/example1.co.jp
RUN ln -s /var/www/html/php-example/example2.co.jp /home/example2.co.jp
RUN ln -s /var/www/html/php-example/nuxtapp /home/nuxtapp

# svn��F�؋L������悤�ݒ�
RUN mkdir ~/.subversion
RUN echo -e "[global]\nstore-passwords = yes\nstore-auth-creds = yes" > ~/.subversion/config

# 言語を日本語に設定
RUN localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
RUN echo 'LANG="ja_JP.UTF-8"' >  /etc/locale.conf
ENV LANG ja_JP.UTF-8

# 日付を日本語に設定
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
