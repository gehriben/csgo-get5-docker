docker run -dt --name csgo_server_5 --network=host \
 -e SERVER_TOKEN=6CE1D45E933B9C6C3B8E56ABD3F273F2 \
 -e PASSWORD=password \
 -e RCON_PASSWORD=rconpassword \
 -e GOTV_PASSWORD=gotvpassword \
 -e PORT=50005 \
 -e GOTV_PORT=51005 \
 -e CUSTOM_ARGS="+sv_lan 0 +tv_enable 1 +tv_advertise_watchable 1" \
 -e MATCH_CONFIG="{\"num_maps\": 2, \
                \"maplist\": [\"de_anubis\", \"de_inferno\", \"de_mirage\", \"de_nuke\", \"de_overpass\", \"de_ancient\", \"de_vertigo\"], \
                 \"skip_veto\": 0, \
                 \"veto_first\": \"team1\", \
                 \"side_type\": \"standard\", \
                 \"team1\": {\"name\": \"Team 1\", \
                             \"flag\": \"DE\"}, \
                 \"team2\": {\"name\": \"Team 2\", \
                             \"flag\": \"DE\"}, \
                 \"cvars\": {\"hostname\": \"CSGO CAGGTUS SERVER\", \"get5_check_auths\": 0, \"get5_backup_system_enabled\": \"1\", \"get5_print_damage\": \"1\"}}" \
 gehriben/csgo 