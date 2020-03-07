#!/bin/bash

# normal updates
yum -y update

# remi
yum -y install centos-release-scl && \
  yum clean all

# httpd24
yum -y install httpd24 httpd24-mod_proxy_html httpd24-mod_session httpd24-mod_ssl && \
  scl enable httpd24 bash && \
  yum clean all

mkdir -p /opt/rh/httpd24/root/etc/httpd/Includes
mkdir -p /etc/httpd/ssl
