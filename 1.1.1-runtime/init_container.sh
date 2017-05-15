#!/usr/bin/env bash
service ssh start
mkdir -p /home/LogFiles
touch /home/LogFiles/dotnet_$WEBSITE_ROLE_INSTANCE_ID_out.log
echo "$(date) Container started" >> /home/LogFiles/node_$WEBSITE_ROLE_INSTANCE_ID_out.log

[ $# -ne 0 ] && exec "$@"

CSPROJ=`ls -1 /home/site/repository/*.csproj 2>/dev/null | head -1`

if [ -n "$CSPROJ" ]; then
  DLL=./`basename "$CSPROJ" .csproj`.dll
  echo Found: $DLL
  [ -e "$DLL" ] && exec dotnet "$DLL"
fi

echo Could not find .csproj or .dll. Using default.
cd /defaulthome/hostingstart
exec dotnet hostingstart.dll
