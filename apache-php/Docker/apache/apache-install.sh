#!/bin/bash

yum -y update && yum -y install centos-release-scl install httpd24 httpd24-mod_proxy_html \
  httpd24-mod_session httpd24-mod_ssl && scl enable httpd24 bash && yum clean all

mkdir -p /opt/rh/httpd24/root/etc/httpd/Includes
mkdir -p /etc/httpd/ssl
