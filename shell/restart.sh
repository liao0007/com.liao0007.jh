#!/bin/bash

# $1 = play environment root path

steamcmd_dir="$HOME/steamcmd"
install_dir="$HOME/dontstarvetogether_dedicated_server"
cluster_name="MyDediServer"
dontstarve_dir="$HOME/.klei/DoNotStarveTogether"

#update app
$steamcmd_dir/steamcmd.sh +force_install_dir "$install_dir" +login anonymous +app_update 343050 validate +quit
ssh root@lab.youleligou.com $steamcmd_dir/steamcmd.sh +force_install_dir "$install_dir" +login anonymous +app_update 343050 validate +quit

$1/shell/sync_mod_config.sh $1
$1/shell/sync_world_config.sh $1

screen -S dst -p 0 -X quit
screen -S dst -d -m /root/run_dedicated_servers.sh

ssh root@lab.youleligou.com screen -S dst -p 0 -X quit
ssh root@lab.youleligou.com screen -S dst -d -m /root/run_dedicated_servers.sh