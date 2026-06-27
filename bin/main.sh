#!/bin/bash
BIN_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "${BIN_DIR}"/vars.sh
source "${BIN_DIR}"/utils.sh

for net in ${NETWORKS_CONF[@]}; do

	echo "Network: " $net;
done
