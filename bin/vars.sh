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
PRIVROUTER_CONF="$INSTALL_DIR"/conf/privrouter.conf


