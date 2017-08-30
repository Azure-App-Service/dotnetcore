#!/usr/bin/env bash
service ssh start
mkdir -p /home/LogFiles
touch /home/LogFiles/dotnet_${WEBSITE_ROLE_INSTANCE_ID}_out.log
echo "$(date) Container started" >> /home/LogFiles/dotnet_${WEBSITE_ROLE_INSTANCE_ID}_out.log

[ -z "$ASPNETCORE_URLS" ] && export ASPNETCORE_URLS=http://*:"$PORT"

# If there is any command line argument specified, run it
[ $# -ne 0 ] && exec "$@"

# Pick up one .csproj file from repository where git push puts files into
CSPROJ=`ls -1 /home/site/repository/*.csproj 2>/dev/null | head -1`

# Convert /home/site/repository/<name>.csproj into ./<name>.dll and execute it
if [ -n "$CSPROJ" ]; then
  DLL=./`basename "$CSPROJ" .csproj`.dll
  echo Found: $DLL
  [ -e "$DLL" ] && exec dotnet "$DLL"
fi

echo Could not find .csproj or .dll. Using default.
cd /defaulthome/hostingstart
exec dotnet hostingstart.dll
