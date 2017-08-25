#!/bin/bash

steamcmd_dir="$HOME/steamcmd"
install_dir="$HOME/dontstarvetogether_dedicated_server"
cluster_name="MyDediServer"
dontstarve_dir="$HOME/.klei/DoNotStarveTogether"

#update app
$steamcmd_dir/steamcmd.sh +force_install_dir "$install_dir" +login anonymous +app_update 343050 validate +quit
ssh root@lab.youleligou.com $steamcmd_dir/steamcmd.sh +force_install_dir "$install_dir" +login anonymous +app_update 343050 validate +quit

./sync_mod_config.sh
./sync_world_config.sh

screen -S dst -p 0 -X quit
screen -S dst -d -m /root/run_dedicated_servers.sh

ssh root@lab.youleligou.com screen -S dst -p 0 -X quit
ssh root@lab.youleligou.com screen -S dst -d -m /root/run_dedicated_servers.sh