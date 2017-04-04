#!/usr/bin/env bash
service ssh start
mkdir -p /home/LogFiles
touch /home/LogFiles/dotnet_$WEBSITE_ROLE_INSTANCE_ID_out.log
echo "$(date) Container started" >> /home/LogFiles/node_$WEBSITE_ROLE_INSTANCE_ID_out.log

if [ $# -eq 0 ]
  then
    cd /defaulthome/hostingstart
    exec dotnet hostingstart.dll
  else
    exec "$@"
fi
