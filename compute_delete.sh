#!/bin/bash

#
# Delete the instance and the disk. NB: if you just want to stop the instance, use the
# compute_stop.sh script. That'll save money (except disk storage).
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

. "${DIR}/common.sh"

gcloud compute instances --project=${GCP_PROJECT} delete --quiet --zone=${GCP_ZONE} ${GCP_INSTANCE_NAME}
gcloud compute disks --project=${GCP_PROJECT} delete --quiet --zone=${GCP_ZONE} ${GCP_INSTANCE_NAME}
