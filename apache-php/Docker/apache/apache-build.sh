#!/bin/bash

cp /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf_org

sed -i "s/    DirectoryIndex index.html/    DirectoryIndex index.php/" /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
sed -i "s/#ServerName www.example.com:80/ServerName localhost:80/" /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
sed -i "s/Listen 80/Listen 80\nListen 10080/" /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
sed -i "s/User apache/User www-data/" /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
sed -i "s/Group apache/Group www-data/" /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf

echo "# クリックジャッキング対策" >> /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
echo "Header always append X-Frame-Options SAMEORIGIN" \
    >> /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf

echo "# XSS対策" >> /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
echo "Header set X-XSS-Protection '1; mode=block'" \
    >> /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
echo "Header set X-Content-Type-Options nosniff" \
    >> /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf

echo "Include Includes/*.conf" \
    >> /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf

mkdir -p /var/www/html

