#!/bin/bash
set -e

# Replace HTTP port 8080 with Render's $PORT
sed -i "s/port=\"8080\"/port=\"${PORT}\"/g" $CATALINA_HOME/conf/server.xml

# Disable shutdown port (set to -1)
sed -i 's/Server port="8005"/Server port="-1"/g' $CATALINA_HOME/conf/server.xml

exec catalina.sh run
