FROM microsoft/dotnet:1.0.4-runtime
MAINTAINER Azure App Services Container Images <appsvc-images@microsoft.com>

COPY bin.zip /tmp
COPY static /defaulthome/hostingstart/static
COPY init_container.sh /bin/

RUN apt-get update \
  && apt-get install -y apt-utils --no-install-recommends \
  && apt-get install -y unzip --no-install-recommends

RUN unzip -q -o /tmp/bin.zip -d /defaulthome/hostingstart \
    && rm /tmp/bin.zip

RUN echo "root:Docker!" | chpasswd \
    && apt update \
    && apt install -y --no-install-recommends openssh-server \
    && chmod 755 /bin/init_container.sh 

COPY sshd_config /etc/ssh/

EXPOSE 2222 80

WORKDIR /defaulthome/hostingstart

CMD ["/bin/init_container.sh"]
