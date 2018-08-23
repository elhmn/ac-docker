# ************************************************************************** #
#                                                                            #
#   remove_cluster.sh                                                        #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Sun Aug 26 10:06:36 2018                        by elhmn        #
#   Updated: Sun Aug 26 10:13:58 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #


#!/bin/sh

# Usage :
# ./script.sh vmName vmCount

vmName=acvm
vmCount=6

if [ ! -z "$2" ]; then
	echo "vmCount= $2"
	vmCount=$2
fi

if [ ! -z "$1" ]; then
	echo "vmName= $1"
	vmName=$1
fi

for i in $(seq 1 $vmCount); do
	docker-machine ssh $vmName$i docker swarm leave --force
done

