#!/bin/bash

function usage {
    echo "Usage: $0 [--server-token <server_token>] [--password <password>] [--rcon-password <rcon_password>] [--gotv-password <gotv_password>] [--public-address <public_address>] [--ip <ip>] [--port <port>] [--gotv-port <gotv_port>] [--client-port <client_port>] [--tickrate <tickrate>] [--maxplayers <maxplayers>] [--gametype <gametype>] [--gamemode <gamemode>] [--mapgroup <mapgroup>] [--map <map>] [--host-workshop-collection <host_workshop_collection>] [--workshop-start-map <workshop_start_map>] [--workshop-authkey <workshop_authkey>] [--autoexec <autoexec>] [--update-on-launch] [--match-config <match_config>]"
}

# Default options
SERVER_TOKEN=""
PASSWORD=""
RCON_PASSWORD=""
GOTV_PASSWORD=""
PUBLIC_ADDRESS=""
IP=""
PORT=""
GOTV_PORT=""
CLIENT_PORT=""
TICKRATE=128
MAXPLAYERS=10
GAMETYPE=0
GAMEMODE=1
MAPGROUP="mg_active"
MAP="de_mirage"
HOST_WORKSHOP_COLLECTION=""
WORKSHOP_START_MAP=""
WORKSHOP_AUTHKEY=""
AUTOEXEC=""
UPDATE_ON_LAUNCH=0
MATCH_CONFIG=""

# Parse options
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --server-token) SERVER_TOKEN="$2"; shift ;;
        --password) PASSWORD="$2"; shift ;;
        --rcon-password) RCON_PASSWORD="$2"; shift ;;
        --gotv-password) GOTV_PASSWORD="$2"; shift ;;
        --public-address) PUBLIC_ADDRESS="$2"; shift ;;
        --ip) IP="$2"; shift ;;
        --port) PORT="$2"; shift ;;
        --gotv-port) GOTV_PORT="$2"; shift ;;
        --client-port) CLIENT_PORT="$2"; shift ;;
        --tickrate) TICKRATE="$2"; shift ;;
        --maxplayers) MAXPLAYERS="$2"; shift ;;
        --gametype) GAMETYPE="$2"; shift ;;
        --gamemode) GAMEMODE="$2"; shift ;;
        --mapgroup) MAPGROUP="$2"; shift ;;
        --map) MAP="$2"; shift ;;
        --host-workshop-collection) HOST_WORKSHOP_COLLECTION="$2"; shift ;;
        --workshop-start-map) WORKSHOP_START_MAP="$2"; shift ;;
        --workshop-authkey) WORKSHOP_AUTHKEY="$2"; shift ;;
        --autoexec) AUTOEXEC="$2"; shift ;;
        --update-on-launch) UPDATE_ON_LAUNCH=1 ;;
        --match-config) MATCH_CONFIG="$2"; shift ;;
        -h|--help) usage; exit 0 ;;
        *) echo "Unknown parameter passed: $1"; usage; exit 1 ;;
    esac
    shift
done

# Set launch options
ARGS="-game csgo -console -usercon -steam_dir $STEAMCMD_DIR -steamcmd_script $STEAMCMD_DIR/steamcmd.sh -ip ${IP:-0.0.0.0}"

if [ -n "$SERVER_TOKEN" ]
then
    ARGS="$ARGS +sv_setsteamaccount $SERVER_TOKEN"
fi
if [ -n "$PASSWORD" ]
then
    ARGS="$ARGS +sv_password $PASSWORD"
fi
if [ -n "$RCON_PASSWORD" ]
then
    ARGS="$ARGS +rcon_password $RCON_PASSWORD"
fi
if [ -n "$GOTV_PASSWORD" ]
then
    ARGS="$ARGS +tv_password $GOTV_PASSWORD"
fi
if [ -n "$PUBLIC_ADDRESS" ]
then
    ARGS="$ARGS +net_public_adr $PUBLIC_ADDRESS"
fi
if [ -n "$IP" ]
then
    ARGS="$ARGS -ip $IP"
else
    ARGS="$ARGS -ip 0.0.0.0"
fi
if [ -n "$PORT" ]
then
    ARGS="$ARGS -port $PORT"
fi
if [ -n "$GOTV_PORT" ]
then
    ARGS="$ARGS +tv_port $GOTV_PORT"
fi
if [ -n "$CLIENT_PORT" ]
then
    ARGS="$ARGS +clientport $CLIENT_PORT"
fi
if [ -n "$TICKRATE" ]
then
    ARGS="$ARGS -tickrate $TICKRATE"
fi
if [ -n "$MAXPLAYERS" ]
then
    ARGS="$ARGS -maxplayers_override $MAXPLAYERS"
fi
if [ -n "$GAMETYPE" ]
then
    ARGS="$ARGS +game_type $GAMETYPE"
fi
if [ -n "$GAMEMODE" ]
then
    ARGS="$ARGS +game_mode $GAMEMODE"
fi
if [ -n "$MAPGROUP" ]
then
    ARGS="$ARGS +mapgroup $MAPGROUP"
fi
if [ -n "$MAP" ]
then
    ARGS="$ARGS +map $MAP"
fi
if [ -n "$HOST_WORKSHOP_COLLECTION" ]
then
    ARGS="$ARGS +host_workshop_collection $HOST_WORKSHOP_COLLECTION"
fi
if [ -n "$WORKSHOP_START_MAP" ]
then
    ARGS="$ARGS +workshop_start_map $WORKSHOP_START_MAP"
fi
if [ -n "$WORKSHOP_AUTHKEY" ]
then
    ARGS="$ARGS -authkey $WORKSHOP_AUTHKEY"
fi
if [ -n "$AUTOEXEC" ]
then
    ARGS="$ARGS +exec $AUTOEXEC"
fi
if [ $UPDATE_ON_LAUNCH -eq 1 ]
then
    ARGS="$ARGS -autoupdate"
fi
if [ -n "$CUSTOM_ARGS" ]
then
    ARGS="$ARGS $CUSTOM_ARGS"
fi
if [ -n "$MATCH_CONFIG" ]
then
    echo $MATCH_CONFIG > $CSGO_DIR/csgo/match_config.json
    echo 'get5_autoload_config match_config.json' > $CSGO_DIR/csgo/cfg/sourcemod/get5.cfg
else
    echo 'get5_check_auths 0' > $CSGO_DIR/csgo/cfg/sourcemod/get5.cfg
fi


#################
# Launch server #
#################
cd $CSGO_DIR
echo "./srcds_run $ARGS"
./srcds_run $ARGS