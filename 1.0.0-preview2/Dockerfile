FROM microsoft/dotnet:latest
COPY src /defaulthome/hostingstart
COPY static /defaulthome/hostingstart/static

WORKDIR /defaulthome/hostingstart

RUN dotnet restore
RUN dotnet build

CMD ["dotnet","/defaulthome/hostingstart/bin/Debug/netcoreapp1.0/hostingstart.dll"]
