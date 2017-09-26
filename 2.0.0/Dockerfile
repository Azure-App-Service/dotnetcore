FROM microsoft/aspnetcore:2.0.0
MAINTAINER Azure App Services Container Images <appsvc-images@microsoft.com>

COPY bin.zip /tmp
COPY init_container.sh /bin/
COPY hostingstart.html /home/site/wwwroot/
COPY sshd_config /etc/ssh/

RUN apt-get update \
  && apt-get install -y apt-utils --no-install-recommends \
  && apt-get install -y unzip --no-install-recommends \
  && mkdir -p /defaulthome/hostingstart \ 
  && unzip -q -o /tmp/bin.zip -d /defaulthome/hostingstart \
  && rm /tmp/bin.zip \
  && echo "root:Docker!" | chpasswd \
  && echo "cd /home" >> /etc/bash.bashrc \
  && apt update \
  && apt install -y --no-install-recommends openssh-server vim curl wget tcptraceroute \
  && chmod 755 /bin/init_container.sh \
  && mkdir -p /home/LogFiles/

EXPOSE 2222 8080

ENV PORT 8080
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot
ENV ASPNETCORE_URLS=

WORKDIR /home/site/wwwroot

ENTRYPOINT ["/bin/init_container.sh"]
