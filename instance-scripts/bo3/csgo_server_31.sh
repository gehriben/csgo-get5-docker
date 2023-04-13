docker run -dt --name csgo_server_31 --network=host \
 -e SERVER_TOKEN=8B5CB918D56528B7CE8360EAA00C66DC \
 -e PASSWORD=password \
 -e RCON_PASSWORD=rconpassword \
 -e GOTV_PASSWORD=gtovpassword \
 -e PORT=50031 \
 -e GOTV_PORT=51031 \
 -e CUSTOM_ARGS="+sv_lan 0" \
 -e MATCH_CONFIG="{\"num_maps\": 3, \
                   \"maplist\": [\"de_dust2\", \"de_inferno\", \"de_mirage\", \"de_nuke\", \"de_overpass\", \"de_train\", \"de_vertigo\"], \
                   \"skip_veto\": 0, \
                   \"veto_first\": \"team1\", \
                   \"side_type\": \"standard\", \
                   \"team1\": {\"name\": \"Team 1\", \
                             \"flag\": \"DE\"}, \
                   \"team2\": {\"name\": \"Team 2\", \
                             \"flag\": \"DE\"}, \
                   \"cvars\": {\"hostname\": \"CSGO Server\", \"get5_check_auths\": 0, \"get5_backup_system_enabled\": \"1\"}}" \
 gehriben/csgo 