# ************************************************************************** #
#                                                                            #
#   createSwarmCluster.sh                                                    #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created:                                                 by elhmn        #
#   Updated: Sun Aug 26 10:51:28 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin/sh

# Usage :
# ./script.sh vmName vmCount

createSwarmCluster()
{
	vmName=$1
	vmCount=$2
	leaderIp=$(docker-machine ip "$vmName"1)

	docker-machine ssh "$vmName"1 docker swarm init --advertise-addr $leaderIp
	joinCommand=$(docker swarm join-token manager | sed -n '2,$p')
	for i in $(seq 2 $vmCount); do
		docker-machine ssh $vmName$i $joinCommand
	done
}

setupNodes()
{
	vmName=$1
	vmCount=$2

	createSwarmCluster $vmName $vmCount
# 	create swarm internal network
	docker network create --driver=overlay --attachable webnet

	if [ $vmCount -ge 2 ]; then
		docker node update --label-add apidb=true  $vmName"1"
		docker node update --label-add authdb=true  $vmName"2"
	fi
}
