#!/bin/bash

. /env.sh

MC_RCONPASS=`grep rcon\.password /opt/minecraft/${MC_INSTANCE_NAME}/server.properties | awk -F '[=]' '{print $2}'`

announce1='tellraw @a {"text":"\u203b\u3053\u306e\u30b5\u30fc\u30d0\u30fc\u306f\u691c\u8a3c\u30b5\u30fc\u30d0\u30fc\u3067\u3059\u203b","bold":true,"color":"red"}'
/var/www/html/console/mcrcon -H 127.0.0.1 -P 25575 -p "${MC_RCONPASS}" -s "${announce1}"
