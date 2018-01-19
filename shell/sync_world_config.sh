#!/bin/bash
# $1 = play environment root path

#sync word gen config
scp $1/uploaded/leveldataoverride_1.lua /root/.klei/DoNotStarveTogether/MyDediServer/Master/leveldataoverride.lua
scp $1/uploaded/leveldataoverride_2.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave01/leveldataoverride.lua
scp $1/uploaded/leveldataoverride_3.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave02/leveldataoverride.lua
scp $1/uploaded/leveldataoverride_4.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave03/leveldataoverride.lua
scp $1/uploaded/leveldataoverride_5.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave04/leveldataoverride.lua
