#!/bin/sh


#Simple BASH script to print out Instance ID and Region of an AWS Instance(Uses some python lib.)

get_instanceDetails () {
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python -c "import sys, json; print(json.load(sys.stdin))['region']")
INFO=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --region $REGION)

printf "Instance Id: ${INSTANCE_ID} \nRegion: ${REGION}\n"

#printf "$INFO"
}

get_instanceDetails
