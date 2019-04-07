#!/bin/bash

#
# Simple facade on compute_ssh. Mostly an alias.
#
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

. "${DIR}/common.sh"


"${DIR}/compute_ssh.sh"
