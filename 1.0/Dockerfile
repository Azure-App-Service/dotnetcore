FROM mcr.microsoft.com/oryx/dotnetcore:1.0-20190712.5
LABEL maintainer="Azure App Services Container Images <appsvc-images@microsoft.com>"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        unzip \
        openssh-server \
        vim \
        curl \
        wget \
        tcptraceroute \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /defaulthome/hostingstart \
    && mkdir -p /home/LogFiles/ \
    && echo "root:Docker!" | chpasswd \
    && echo "cd /home" >> /etc/bash.bashrc

COPY bin.zip /tmp
RUN unzip -q -o /tmp/bin.zip -d /defaulthome/hostingstart \
    && rm /tmp/bin.zip

COPY init_container.sh /bin/
RUN chmod 755 /bin/init_container.sh

COPY hostingstart.html /defaulthome/hostingstart/wwwroot/

# configure startup
COPY sshd_config /etc/ssh/
COPY ssh_setup.sh /tmp
RUN mkdir -p /opt/startup \
   && chmod -R +x /opt/startup \
   && chmod -R +x /tmp/ssh_setup.sh \
   && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null) \
   && rm -rf /tmp/*

ENV PORT 8080
ENV SSH_PORT 2222
EXPOSE 8080 2222

ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot
ENV ASPNETCORE_URLS=
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true

WORKDIR /home/site/wwwroot

ENTRYPOINT ["/bin/init_container.sh"]
