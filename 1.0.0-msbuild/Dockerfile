FROM microsoft/dotnet:1.0-sdk-msbuild
MAINTAINER Azure App Services Container Images <appsvc-images@microsoft.com>

COPY src /defaulthome/hostingstart
COPY static /defaulthome/hostingstart/static
COPY init_container.sh /bin/

RUN echo "root:Docker!" | chpasswd \
    && apt update \
    && apt install -y --no-install-recommends openssh-server \
    && chmod 755 /bin/init_container.sh 

COPY sshd_config /etc/ssh/

EXPOSE 2222 80

WORKDIR /defaulthome/hostingstart

RUN dotnet restore
RUN dotnet build

CMD ["/bin/init_container.sh"]
