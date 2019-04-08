#!/bin/bash

#
# This will create a VM instance with sufficient cores, memory, and disk to run
# this exercise. The user is responsible for defining the project.
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

. "${DIR}/common.sh"


# You can associate a service account explicitly. The get_svc_account.sh script
# looks for the default *compute* service account. But, this doesn't seem necessary.
# If desired, uncomment the line, and place the argument in the create line.
#
# GCP_SVC_ACCT=${GCP_SVC_ACCT:-`./get_svc_account.sh`}
# --service-account=${GCP_SVC_ACCT}

echo "NB: using zone us-west1-b and not ${GCP_ZONE}"
gcloud compute --project=${GCP_PROJECT} instances create ${GCP_INSTANCE_NAME} --zone=us-west1-b --machine-type=custom-6-26624 --subnet=default --network-tier=PREMIUM --no-restart-on-failure --maintenance-policy=TERMINATE --preemptible --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --accelerator=type=nvidia-tesla-k80,count=1 --tags=k8s-nodeport,http-server,https-server --image=ubuntu-1804-bionic-v20190404 --image-project=ubuntu-os-cloud --boot-disk-size=200GB --no-boot-disk-auto-delete --boot-disk-type=pd-standard --boot-disk-device-name=kubeflow
