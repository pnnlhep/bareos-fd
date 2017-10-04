FROM centos:centos7
MAINTAINER Kevin Fox "Kevin.Fox@pnnl.gov"

RUN yum upgrade -y; \
    curl -o /etc/yum.repos.d/bareos.repo http://download.bareos.org/bareos/release/14.2/CentOS_7/bareos.repo; \
    curl -o /etc/yum.repos.d/bareos-contrib.repo http://download.bareos.org/bareos/contrib/CentOS_7/bareos:contrib.repo; \
    yum install -y https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm; \
    yum install -y postgresql96; \
    yum install -y bareos-filedaemon bareos-filedaemon-python-plugin bareos-contrib-filedaemon-python-plugin-mysql;

USER bareos
CMD /usr/sbin/bareos-fd -c /etc/bareos/bareos-fd.conf -f
