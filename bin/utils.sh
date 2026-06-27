#!/bin/bash
function get_param {

	echo "$(grep -F "$1" "$2" | head -n 1 | cut -d '=' -f2)";
}
