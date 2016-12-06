FROM microsoft/dotnet:1.1.0-sdk-projectjson
COPY src /defaulthome/hostingstart
COPY static /defaulthome/hostingstart/static

WORKDIR /defaulthome/hostingstart

RUN dotnet restore
RUN dotnet build

CMD ["dotnet","/defaulthome/hostingstart/bin/Debug/netcoreapp1.0/hostingstart.dll"]
