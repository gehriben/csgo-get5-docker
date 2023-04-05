docker run -it --network=host \
 -e PASSWORD=password \
 -e RCON_PASSWORD=rconpassword \
 -e GOTV_PASSWORD=gtovpassword \
 -e PORT=27115 \
 -e GOTV_PORT=27120 \
 -e MATCH_CONFIG="{'matchid': '81a99ef9a2844c278c2bda2f5a77a793', \
                   'num_maps': 3, \
                   'maplist': ['de_dust2', 'de_inferno', 'de_mirage', 'de_nuke', 'de_overpass', 'de_train', 'de_vertigo'], \
                   'skip_veto': False }" \
 gehriben/csgo

