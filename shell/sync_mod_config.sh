#!/bin/bash

scp ./../uploaded/dedicated_server_mods_setup.lua /root/dontstarvetogether_dedicated_server/mods/dedicated_server_mods_setup.lua
scp ./../uploaded/dedicated_server_mods_setup.lua root@lab.youleligou.com:/root/dontstarvetogether_dedicated_server/mods/dedicated_server_mods_setup.lua

#sync mod config
scp ./../uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Master/
scp ./../uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave01/
scp ./../uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave02/
scp ./../uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave03/
scp ./../uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave04/
scp ./../uploaded/modoverrides.lua root@lab.youleligou.com:/root/.klei/DoNotStarveTogether/MyDediServer/Slave01/
scp ./../uploaded/modoverrides.lua root@lab.youleligou.com:/root/.klei/DoNotStarveTogether/MyDediServer/Slave02/