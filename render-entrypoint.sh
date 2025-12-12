#!/bin/bash
set -e

# Replace port in server.xml with Render’s $PORT
sed -i "s/port=\"8080\"/port=\"${PORT}\"/g" $CATALINA_HOME/conf/server.xml

exec catalina.sh run
