FROM registry.access.redhat.com/ubi8/ubi:8.0

RUN yum install -y --disableplugin=subscription-manager httpd
RUN yum clean all --disableplugin=subscription-manager -y 

LABEL version="1.0"
LABEL description="Descriptions"
MAINTAINER IBM LBS <ibm@ibm.com>

# Allows child images to inject their own content into DocumentRoot
ONBUILD COPY src/ ${DOCROOT}/
ONBUILD VAR=PRD_ONBUILD

USER root

# Launch httpd
CMD bash -c "while true; do echo date; echo $VAR; sleep 5; done"
