#!/bin/bash

# node.js
curl -sL https://rpm.nodesource.com/setup_12.x | bash -
yum install -y nodejs && yum clean all
rm -rf /var/lib/apt/lists/*
echo "hostname=mail.example.co.jp" > /etc/ssmtp/ssmtp.conf
echo "root=root@mail.example.co.jp" >> /etc/ssmtp/ssmtp.conf
echo "mailhub=postfix-sv" >> /etc/ssmtp/ssmtp.conf
echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf
echo "localhost localhost.localdomain" >> /etc/hosts

chmod 700 /usr/local/bin/dns-regist.sh
chown root:root /usr/local/bin/dns-regist.sh

sed -i "s/;date.timezone =/date.timezone = Asia\/Tokyo/" /etc/opt/remi/php72/php.ini

mkdir -p /var/www/html
useradd www-data
echo 'www-data:www-data' |chpasswd

mv /etc/opt/remi/php72/php.d/20-bcmath.ini /etc/opt/remi/php72/php.d/20-bcmath.ini_back
mv /etc/opt/remi/php72/php.d/20-bz2.ini /etc/opt/remi/php72/php.d/20-bz2.ini_back
mv /etc/opt/remi/php72/php.d/20-calendar.ini /etc/opt/remi/php72/php.d/20-calendar.ini_back
mv /etc/opt/remi/php72/php.d/20-ctype.ini /etc/opt/remi/php72/php.d/20-ctype.ini_back
mv /etc/opt/remi/php72/php.d/20-curl.ini /etc/opt/remi/php72/php.d/20-curl.ini_back
mv /etc/opt/remi/php72/php.d/20-dom.ini /etc/opt/remi/php72/php.d/20-dom.ini_back
mv /etc/opt/remi/php72/php.d/20-exif.ini /etc/opt/remi/php72/php.d/20-exif.ini_back
mv /etc/opt/remi/php72/php.d/20-fileinfo.ini /etc/opt/remi/php72/php.d/20-fileinfo.ini_back
mv /etc/opt/remi/php72/php.d/20-ftp.ini /etc/opt/remi/php72/php.d/20-ftp.ini_back
mv /etc/opt/remi/php72/php.d/20-gd.ini /etc/opt/remi/php72/php.d/20-gd.ini_back
mv /etc/opt/remi/php72/php.d/20-gettext.ini /etc/opt/remi/php72/php.d/20-gettext.ini_back
mv /etc/opt/remi/php72/php.d/20-iconv.ini /etc/opt/remi/php72/php.d/20-iconv.ini_back
mv /etc/opt/remi/php72/php.d/20-intl.ini /etc/opt/remi/php72/php.d/20-intl.ini_back
mv /etc/opt/remi/php72/php.d/20-json.ini /etc/opt/remi/php72/php.d/20-json.ini_back
mv /etc/opt/remi/php72/php.d/20-mbstring.ini /etc/opt/remi/php72/php.d/20-mbstring.ini_back
mv /etc/opt/remi/php72/php.d/20-mysqlnd.ini /etc/opt/remi/php72/php.d/20-mysqlnd.ini_back
mv /etc/opt/remi/php72/php.d/20-pdo.ini /etc/opt/remi/php72/php.d/20-pdo.ini_back
mv /etc/opt/remi/php72/php.d/20-pgsql.ini /etc/opt/remi/php72/php.d/20-pgsql.ini_back
mv /etc/opt/remi/php72/php.d/20-phar.ini /etc/opt/remi/php72/php.d/20-phar.ini_back
mv /etc/opt/remi/php72/php.d/20-posix.ini /etc/opt/remi/php72/php.d/20-posix.ini_back
mv /etc/opt/remi/php72/php.d/20-shmop.ini /etc/opt/remi/php72/php.d/20-shmop.ini_back
mv /etc/opt/remi/php72/php.d/20-simplexml.ini /etc/opt/remi/php72/php.d/20-simplexml.ini_back
mv /etc/opt/remi/php72/php.d/20-soap.ini /etc/opt/remi/php72/php.d/20-soap.ini_back
mv /etc/opt/remi/php72/php.d/20-sockets.ini /etc/opt/remi/php72/php.d/20-sockets.ini_back
mv /etc/opt/remi/php72/php.d/20-sqlite3.ini /etc/opt/remi/php72/php.d/20-sqlite3.ini_back
mv /etc/opt/remi/php72/php.d/20-sysvmsg.ini /etc/opt/remi/php72/php.d/20-sysvmsg.ini_back
mv /etc/opt/remi/php72/php.d/20-sysvsem.ini /etc/opt/remi/php72/php.d/20-sysvsem.in_back
mv /etc/opt/remi/php72/php.d/20-sysvshm.ini /etc/opt/remi/php72/php.d/20-sysvshm.ini_back
mv /etc/opt/remi/php72/php.d/20-tokenizer.ini /etc/opt/remi/php72/php.d/20-tokenizer.ini_back
mv /etc/opt/remi/php72/php.d/20-xml.ini /etc/opt/remi/php72/php.d/20-xml.ini_back
mv /etc/opt/remi/php72/php.d/20-xmlwriter.ini /etc/opt/remi/php72/php.d/20-xmlwriter.ini_back
mv /etc/opt/remi/php72/php.d/20-xsl.ini /etc/opt/remi/php72/php.d/20-xsl.ini_back
mv /etc/opt/remi/php72/php.d/30-mcrypt.ini /etc/opt/remi/php72/php.d/30-mcrypt.ini_back
mv /etc/opt/remi/php72/php.d/30-mysqli.ini /etc/opt/remi/php72/php.d/30-mysqli.ini_back
mv /etc/opt/remi/php72/php.d/30-pdo_dblib.ini /etc/opt/remi/php72/php.d/30-pdo_dblib.ini_back
mv /etc/opt/remi/php72/php.d/30-pdo_mysql.ini /etc/opt/remi/php72/php.d/30-pdo_mysql.ini_back
mv /etc/opt/remi/php72/php.d/30-pdo_pgsql.ini /etc/opt/remi/php72/php.d/30-pdo_pgsql.ini_back
mv /etc/opt/remi/php72/php.d/30-pdo_sqlite.ini /etc/opt/remi/php72/php.d/30-pdo_sqlite.ini_back
mv /etc/opt/remi/php72/php.d/30-wddx.ini /etc/opt/remi/php72/php.d/30-wddx.ini_back
mv /etc/opt/remi/php72/php.d/30-xmlreader.ini /etc/opt/remi/php72/php.d/30-xmlreader.ini_back
mv /etc/opt/remi/php72/php.d/30-xmlrpc.ini /etc/opt/remi/php72/php.d/30-xmlrpc.ini_back
mv /etc/opt/remi/php72/php.d/40-yaml.ini /etc/opt/remi/php72/php.d/40-yaml.ini_back
mv /etc/opt/remi/php72/php.d/40-zip.ini /etc/opt/remi/php72/php.d/40-zip.ini_back
mv /etc/opt/remi/php72/php.d/50-mongodb.ini /etc/opt/remi/php72/php.d/50-mongodb.ini_back
mv /etc/opt/remi/php72/php.d/50-mysql.ini /etc/opt/remi/php72/php.d/50-mysql.ini_back

cd /tmp/
curl -s https://getcomposer.org/installer | /opt/remi/php72/root/usr/bin/php
mv -i composer.phar /usr/local/bin/composer
cat echo "alias composer='/opt/remi/php72/root/usr/bin/php /usr/local/bin/composer'" > ~/.bash_profile

chown root:www-data /opt/remi/php72/root/usr/sbin/php-fpm && \
  chmod 775 /opt/remi/php72/root/usr/sbin/php-fpm && \
  mkdir -p /var/opt/remi/php72 && \
  touch /var/opt/remi/php72/stdout && \
  chown -R root:www-data /var/opt/remi/php72 && \
  chmod -R 775 /var/opt/remi/php72 && \
  mkdir -p /var/log/php7
  #mkdir -p /var/opt/remi/php72/stdout && \
  #chown root:www-data /var/opt/remi/php72/stdout && \
  #chmod 660 /var/opt/remi/php72/stdout && \
  #chown root:www-data /var/opt/remi/php72/run/php-fpm && \
  #chmod 775 /var/opt/remi/php72/run/php-fpm

# Blackfile
# yum -y install pygpgme
# yum -y install wget
# wget -O - "http://packages.blackfire.io/fedora/blackfire.repo" | tee /etc/yum.repos.d/blackfire.repo
# yum -y install blackfire-agent; exit 0
# blackfire-agent --register --server-id=36bee2c2-b075-4221-baae-589751143491 --server-token=98481d46914bc4eb2e660db9549673bf27690ef0a8abbe7638cd9781acdd2d1e
# /etc/init.d/blackfire-agent restart
# yum -y install blackfire-php
# blackfire config --client-id=e999c7d3-31d3-43b2-880f-14ae2dcc18a6 --client-token=0326695de8e4e1e9f6bdf9f629f61abe37e6931ff0d409e34dac9367e2acdf6e
# yum clean all

