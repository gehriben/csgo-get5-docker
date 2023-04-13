START_PORT = 50001
START_GOTV_PORT = 51001
SCRIPT_COUNT = 32
TOKENS = list()

with open("tokens.txt") as file:
    TOKENS = [line.rstrip() for line in file]

for i in range(SCRIPT_COUNT):
    port = START_PORT+i
    gotv_port = START_GOTV_PORT+i

    f = open("bo5/csgo_server_"+str(i+1)+".sh", "w")
    f.write("docker run -dt --network=host \\\n \
-e SERVER_TOKEN="+str(TOKENS[i])+" \\\n \
-e PASSWORD=password \\\n \
-e RCON_PASSWORD=rconpassword \\\n \
-e GOTV_PASSWORD=gtovpassword \\\n \
-e PORT="+str(port)+" \\\n \
-e GOTV_PORT="+str(gotv_port)+" \\\n \
-e CUSTOM_ARGS=\"+sv_lan 0\" \\\n \
-e MATCH_CONFIG=\"{\\\"num_maps\\\": 5, \\\n\
                   \\\"maplist\\\": [\\\"de_dust2\\\", \\\"de_inferno\\\", \\\"de_mirage\\\", \\\"de_nuke\\\", \\\"de_overpass\\\", \\\"de_train\\\", \\\"de_vertigo\\\"], \\\n \
                  \\\"skip_veto\\\": 0, \\\n \
                  \\\"veto_first\\\": \\\"team1\\\", \\\n \
                  \\\"side_type\\\": \\\"standard\\\", \\\n \
                  \\\"team1\\\": {\\\"name\\\": \\\"Team 1\\\", \\\n \
                            \\\"flag\\\": \\\"DE\\\"}, \\\n \
                  \\\"team2\\\": {\\\"name\\\": \\\"Team 2\\\", \\\n \
                            \\\"flag\\\": \\\"DE\\\"}, \\\n \
                  \\\"cvars\\\": {\\\"hostname\\\": \\\"CSGO Server\\\", \\\"get5_check_auths\\\": 0}}\" \\\n \
gehriben/csgo \
")
    f.close() 