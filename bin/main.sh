#!/bin/bash
BIN_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "${BIN_DIR}"/vars.sh
source "${BIN_DIR}"/utils.sh

if [ $(ip -br a | grep "${MGMT_NIC}") == "" ]; then
	
	echo "Management Interface Not Found! Aborting ...";
	exit 1;
fi

ip addr flush dev ${MGMT_NIC}
ip addr add ${MGMT_ADDR} dev ${MGMT_NIC}
ip link set dev ${MGMT_NIC} up
sleep 0.1

if [ "$MGMT_WEB" == "yes" ]; then systemctl start nginx; fi

