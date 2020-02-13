#!/bin/bash
while true;do 
	status=$(aws ec2 describe-instance-status --instance-id $1 --filters '[{"Name": "instance-status.reachability", "Values": ["passed"]}]' | grep -i Status | awk -F: '{print $2}' | grep -i passed | sed -n 1p)
	if [ -n "$status" ]; then
        echo "server is up and running"
	break
else
	echo "server still not up"
fi
sleep 30
done


