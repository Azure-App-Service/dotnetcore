FROM oryxprod/dotnetcore-2.2:20190301.1
LABEL maintainer="Azure App Services Container Images <appsvc-images@microsoft.com>"

COPY bin.zip /tmp
COPY init_container.sh /bin/

RUN mkdir -p /home/LogFiles \
  && echo "root:Docker!" | chpasswd \
  && echo "cd /home" >> /etc/bash.bashrc \
  && apk update --no-cache \
  && apk add openssh \
  && apk add openrc \
  && apk add vim \
  && apk add curl \
  && apk add wget \
  && apk add tcptraceroute \
  && apk add bash \
  && apk add unzip \
  && mkdir -p /defaulthome/hostingstart \ 
  && unzip -q -o /tmp/bin.zip -d /defaulthome/hostingstart \
  && rm /tmp/bin.zip \
  && chmod 755 /bin/init_container.sh 

COPY hostingstart.html /defaulthome/hostingstart/wwwroot/

# configure startup
COPY sshd_config /etc/ssh/
COPY ssh_setup.sh /tmp
RUN mkdir -p /opt/startup \
   && chmod -R +x /opt/startup \
   && chmod -R +x /tmp/ssh_setup.sh \
   && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null) \
   && rm -rf /tmp/* 

EXPOSE 2222 8080

ENV PORT 8080
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot
ENV ASPNETCORE_URLS=

WORKDIR /home/site/wwwroot

ENTRYPOINT ["/bin/init_container.sh"]
