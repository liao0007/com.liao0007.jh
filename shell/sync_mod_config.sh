#!/bin/bash
# $1 = play environment root path

scp $1/uploaded/dedicated_server_mods_setup.lua /root/dontstarvetogether_dedicated_server/mods/dedicated_server_mods_setup.lua

#sync mod config
scp $1/uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Master/
scp $1/uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave01/
scp $1/uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave02/
scp $1/uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave03/
scp $1/uploaded/modoverrides.lua /root/.klei/DoNotStarveTogether/MyDediServer/Slave04/
