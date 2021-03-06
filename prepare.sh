#!/bin/bash
pkill java
rm -f /opt/minecraft/ccmite.tar.gz
rm -rf /opt/minecraft/test
tar -x -v -f /opt/bk/ccmite.tar.gz -C /opt/minecraft/
mv  /opt/minecraft/ccmite /opt/minecraft/test
rm -f /opt/minecraft/test/plugins/Dynmap-*
rm -f /opt/minecraft/test/plugins/Modern-LWC*
sed -i 's/use-mysql: true/use-mysql: false/g' /opt/minecraft/test/plugins/CoreProtect/config.yml
sed -i 's/server-port=25566/server-port=25585/g' /opt/minecraft/test/server.properties
sed -i 's/rcon.port=25575/rcon.port=25595/g' /opt/minecraft/test/server.properties
sed -i 's/query.port=25566/query.port=25585/g' /opt/minecraft/test/server.properties

cd /opt/minecraft/${MC_INSTANCE_NAME}
if [ ! -e papermc-${MC_VERSION}-${MC_PAPER_BUILD}.jar ]
  then
   curl -s -k --tlsv1.2 https://papermc.io/api/v1/paper/${MC_VERSION}/${MC_PAPER_BUILD}/download -o papermc-${MC_VERSION}-${MC_PAPER_BUILD}.jar
   echo 'eula=true' > eula.txt
   chown -R www-data:www-data *
fi

screen -S mcs su -s /bin/bash - www-data -c "export $TZ=JST-9; export $LANG=ja_JP.UTF-8; cd /opt/minecraft/${MC_INSTANCE_NAME}; /usr/bin/java -server -Xms${MC_RAM} -Xmx${MC_RAM} -XX:MetaspaceSize=512M -XX:+UseG1GC -XX:+UseStringDeduplication -XX:+DisableExplicitGC -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:MaxGCPauseMillis=50 -XX:+UseTLAB -XX:ParallelGCThreads=${MC_CPU_CORE} -jar papermc-${MC_VERSION}-${MC_PAPER_BUILD}.jar nogui"
