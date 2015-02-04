FROM centos:centos6
MAINTAINER Ian Blenke <ian@blenke.com>

ADD epel.repo /etc/yum.repos.d/
ADD RPM-GPG-KEY-EPEL-6 /etc/pki/rpm-gpg/

ADD vmware-tools.repo /etc/yum.repos.d/
RUN yum install -y wget tar vmware-tools-esx-nox

ADD scripts /etc/vmware-tools/scripts
RUN chmod -R +x /etc/vmware-tools/scripts/*

RUN sed -i "s/disable-tools-version=true/disable-tools-version=false/"  /etc/vmware-tools/tools.conf

ADD sbin /usr/sbin

ADD run-services.sh /
RUN chmod +x /run-services.sh

CMD /run-services.sh

