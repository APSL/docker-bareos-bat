# Reference : http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
 
FROM ubuntu:16.04
LABEL maintainer="APSL"

RUN apt-get update && apt-get install -y bareos-bat

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/ubareos && \
    echo "ubareos:x:${uid}:${gid}:ubareos,,,:/home/ubareos:/bin/bash" >> /etc/passwd && \
    echo "ubareos:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/ubareos && \
    usermod -a -G bareos ubareos && \
    apt-get autoremove -y  && \ 
    apt-get autoclean -y 

USER ubareos
ENV HOME /home/ubareos
CMD /usr/bin/bat
