#!/bin/bash

#sync word gen config
scp ./../uploaded/leveldataoverride_1.lua /root/.klei/DoNotStarveTogether/MyDediServer/Master/leveldataoverride.lua
scp ./../uploaded/leveldataoverride_2.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave01/leveldataoverride.lua
scp ./../uploaded/leveldataoverride_3.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave02/leveldataoverride.lua
scp ./../uploaded/leveldataoverride_4.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave03/leveldataoverride.lua
scp ./../uploaded/leveldataoverride_5.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave04/leveldataoverride.lua

scp ./../uploaded/leveldataoverride_6.lua root@lab.youleligou.com:/root/.klei/DoNotStarveTogether/MyDediServer/Slave01/leveldataoverride.lua
scp ./../uploaded/leveldataoverride_7.lua root@lab.youleligou.com:/root/.klei/DoNotStarveTogether/MyDediServer/Slave02/leveldataoverride.lua