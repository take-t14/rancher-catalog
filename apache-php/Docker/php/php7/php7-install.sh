#!/bin/bash

rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y update && yum -y install php72 php72-php php72-php-opcache php72-php-bcmath php72-php-cli \
  php72-php-common php72-php-gd php72-php-intl php72-php-json php72-php-mbstring php72-php-pdo php72-php-pdo-dblib \
  php72-php-devel php72-php-pear php72-php-smarty php72-php-pecl-mcrypt php72-php-xmlrpc php72-php-xml php72-php-mysql php72-php-soap \
  php72-php-fpm php72-php-pdo php72-php-pgsql php72-php-pecl-zip php72-php-pecl-mongodb php72-php-pecl-xdebug php72-php-pecl-yaml \
  ssmtp mailutils gcc-c++ make && yum clean all
cp /etc/opt/remi/php72/php.ini /etc/opt/remi/php72/php.ini_org
cp /etc/opt/remi/php72/php-fpm.conf /etc/opt/remi/php72/php-fpm.conf_org
cp -RT /etc/opt/remi/php72/php-fpm.d /etc/opt/remi/php72/php-fpm.d_org
ln -s /opt/remi/php72/root/usr/bin/php /opt/remi/php72/root/usr/bin/php7
ln -s /opt/remi/php72/root/usr/sbin/php-fpm /opt/remi/php72/root/usr/sbin/php7-fpm