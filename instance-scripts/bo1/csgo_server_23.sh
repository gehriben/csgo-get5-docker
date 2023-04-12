docker run -dt --network=host \
 -e PASSWORD=password \
 -e RCON_PASSWORD=rconpassword \
 -e GOTV_PASSWORD=gtovpassword \
 -e PORT=27023 \
 -e GOTV_PORT=27123 \
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