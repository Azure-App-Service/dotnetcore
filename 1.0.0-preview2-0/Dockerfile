FROM microsoft/dotnet:1.0.0-preview2-sdk
COPY src /defaulthome/hostingstart
COPY static /defaulthome/hostingstart/static
COPY init_container.sh /bin/

WORKDIR /defaulthome/hostingstart

RUN dotnet restore
RUN dotnet build

CMD ["/bin/init_container.sh"]
