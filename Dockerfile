FROM centos:7.5.1804

ARG dict_version=2.9.0-11.el7
ARG expect_version=5.45-14.el7_1
ARG krb5_version=1.15.1-19.el7

COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum -y --setopt=tsflags=nodocs update \
 && yum -y --setopt=tsflags=nodocs install \
    cracklib-dicts-${dict_version} \
    expect-${expect_version} \
    krb5-libs-${krb5_version} \
    krb5-pkinit-${krb5_version} \
    krb5-server-${krb5_version} \
    krb5-server-ldap-${krb5_version} \
 && yum clean all

COPY init_db.sh /init_db

RUN chmod a+x /init_db
