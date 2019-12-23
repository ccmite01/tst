#!/bin/bash

rm -f /opt/minecraft/ccmite.tar.gz
rm -rf /opt/minecraft/test
tar -x -v -f /opt/bk/ccmite.tar.gz -C /opt/minecraft/
mv  /opt/minecraft/ccmite /opt/minecraft/test
