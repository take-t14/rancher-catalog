#!/bin/bash

rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y update && yum -y install php56 php56-php php56-php-opcache php56-php-bcmath php56-php-cli \
  php56-php-common php56-php-gd php56-php-intl php56-php-json php56-php-mbstring php56-php-pdo php56-php-pdo-dblib \
  php56-php-devel php56-php-pear php56-php-smarty php56-php-pecl-mcrypt php56-php-xmlrpc php56-php-xml php56-php-mysql php56-php-soap \
  php56-php-fpm php56-php-pdo php56-php-pgsql php56-php-pecl-zip php56-php-pecl-mongodb php56-php-pecl-xdebug php56-php-pecl-yaml \
  ssmtp mailutils gcc-c++ make && yum clean all
cp /etc/opt/remi/php56/php.ini /etc/opt/remi/php56/php.ini_org
cp /etc/opt/remi/php56/php-fpm.conf /etc/opt/remi/php56/php-fpm.conf_org
cp -RT /etc/opt/remi/php56/php-fpm.d /etc/opt/remi/php56/php-fpm.d_org
ln -s /opt/remi/php56/root/usr/bin/php /opt/remi/php56/root/usr/bin/php5
ln -s /opt/remi/php56/root/usr/sbin/php-fpm /opt/remi/php56/root/usr/sbin/php5-fpm