#!/bin/bash 
source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"/utils.sh

MAIN_CONF="/etc/privrouter/main.conf";

ENCRYPTED="$(get_param "encrypted" $MAIN_CONF)";
INSTALL_DIR="$(get_param "install_dir" $MAIN_CONF)";

GATEWAYS_DIR="$INSTALL_DIR"/conf/gateways
TUNNELS_DIR="$INSTALL_DIR"/conf/tunnels
NETWORKS_DIR="$INSTALL_DIR"/conf/networks
CIRCUITS_DIR="$INSTALL_DIR"/conf/circuits
PROFILES_DIR="$INSTALL_DIR"/conf/profiles

GATEWAYS_CONF="$(ls $GATEWAYS_DIR/*.conf 2>/dev/null)";
NETWORKS_CONF="$(ls $NETWORKS_DIR/*.conf 2>/dev/null)";
TUNNELS_CONF="$(ls $TUNNELS_DIR/*.conf 2>/dev/null)";
CIRCUITS_CONF="$(ls $CIRCUITS_DIR/*.conf 2>/dev/null)";
PROFILES_CONF="$(ls $PROFILES_DIR/*.conf 2>/dev/null)";

PRIVROUTER_CONF="$INSTALL_DIR"/conf/privrouter.conf

MGMT_NIC="$(get_param 'mgmt_nic' $PRIVROUTER_CONF)";
MGMT_SRC="$(get_param 'mgmt_src' $PRIVROUTER_CONF)";
MGMT_WEB="$(get_param 'mgmt_web' $PRIVROUTER_CONF)";
MGMT_ADDR="$(get_param 'mgmt_addr' $PRIVROUTER_CONF)";


