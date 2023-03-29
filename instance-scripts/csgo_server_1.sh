docker run -it --network=host \
 -e PASSWORD=password \
 -e RCON_PASSWORD=rconpassword \
 -e GOTV_PASSWORD=gtovpassword \
 -e PORT=27115 \
 -e GOTV_PORT=27120 \
 -e MATCH_CONFIG="{'matchid': '81a99ef9a2844c278c2bda2f5a77a793', \
                   'num_maps': 1, \
                   'maplist': ['de_inferno', 'de_mirage', 'de_nuke', 'de_overpass', 'de_vertigo', 'de_ancient', 'de_anubis'], \
                   'skip_veto': False }" \
 csgo

