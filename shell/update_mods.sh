#!/bin/bash

cluster_name="MyDediServer"

cd $HOME/dontstarvetogether_dedicated_server/bin/
run_shared=($HOME/dontstarvetogether_dedicated_server/bin/dontstarve_dedicated_server_nullrenderer)
run_shared+=(-cluster "$cluster_name")
run_shared+=(-only_update_server_mods)

"${run_shared[@]}"
