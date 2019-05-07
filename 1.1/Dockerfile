FROM oryxprod/dotnetcore-1.1:20190301.2
LABEL maintainer="Azure App Services Container Images <appsvc-images@microsoft.com>"

COPY bin.zip /tmp
COPY init_container.sh /bin/
COPY sshd_config /etc/ssh/

# jessie moved to archive
RUN echo "deb http://deb.debian.org/debian/ jessie main" > /etc/apt/sources.list \
  && echo "deb-src http://deb.debian.org/debian/ jessie main" >> /etc/apt/sources.list \
  && echo "deb http://security.debian.org/ jessie/updates main" >> /etc/apt/sources.list \
  && echo "deb-src http://security.debian.org/ jessie/updates main" >> /etc/apt/sources.list \
  && echo "deb http://archive.debian.org/debian jessie-backports main" >> /etc/apt/sources.list \
  && echo "deb-src http://archive.debian.org/debian jessie-backports main" >> /etc/apt/sources.list \
  && echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf

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

COPY hostingstart.html /defaulthome/hostingstart/wwwroot/

ENV PORT 8080
ENV SSH_PORT 2222
EXPOSE 8080 2222

ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot

WORKDIR /home/site/wwwroot

ENTRYPOINT ["/bin/init_container.sh"]
