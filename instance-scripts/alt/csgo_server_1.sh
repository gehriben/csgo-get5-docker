docker run -it --network=host \
  csgo \
 --password password \
 --rcon-password rconpassword \
 --gotv-password gtovpassword \
 --port 27115 \
 --gotv-port 27120 \
 --match-config "{'matchid': '81a99ef9a2844c278c2bda2f5a77a793', \
                   'num_maps': 3, \
                   'maplist': ['de_dust2', 'de_inferno', 'de_mirage', 'de_nuke', 'de_overpass', 'de_train', 'de_vertigo'], \
                   'skip_veto': False, \
                   'team1': {'name': 'Astralis', \
                             'tag': 'AST', \
                             'players': {698652696634933762: 'gla1ve', \
                                         234783204182937471: 'Magisk', \
                                         389371614622221912: 'dev1ce', \
                                         951311418417028314: 'dupreeh', \
                                         369417162788295143: 'Xyp9x'}}, \
                   'team2': {'name': 'Natus Vincere', \
                             'tag': 'NAVI', \
                             'players': {875407653610178066: 's1mple', \
                                         979550479724346962: 'Boombl4', \
                                         186841562108230104: 'electronic', \
                                         726408891643982724: 'Perfecto', \
                                         512316566954794515: 'flamie'}}}"

