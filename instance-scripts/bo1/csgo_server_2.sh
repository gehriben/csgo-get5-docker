docker run -dt --network=host \
 -e SERVER_TOKEN=12C4627A69E1B096045E335622BF9FDF \
 -e PASSWORD=password \
 -e RCON_PASSWORD=rconpassword \
 -e GOTV_PASSWORD=gtovpassword \
 -e PORT=27002 \
 -e GOTV_PORT=27102 \
 -e CUSTOM_ARGS="+sv_lan 0" \
 -e MATCH_CONFIG="{'num_maps': 1, \
                   'maplist': ['de_dust2', 'de_inferno', 'de_mirage', 'de_nuke', 'de_overpass', 'de_train', 'de_vertigo'], \
                   'skip_veto': 0, \
                   'veto_first': 'team1', \
                   'side_type': 'standard', \
                   'team1': {'name': 'Team 1', \
                             'flag': 'DE'}, \
                   'team2': {'name': 'Team 2', \
                             'flag': 'DE'}, \
                   'cvars': {'hostname': 'CSGO Server'}}" \
 gehriben/csgo 