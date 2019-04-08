#!/bin/bash

#
# A simple facade on tope of network_create and compute_create_gpu. One less command.
# If called multiple times (create/delete), network_create may complain (fw rule stays)
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
. "${DIR}/common.sh"

echo "Applying Network Settings"
"${DIR}/network_create.sh" > /dev/null 2>&1  # ignore error messages

echo "Creating VM instance"
"${DIR}/compute_create_gpu.sh"
