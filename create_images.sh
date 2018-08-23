# ************************************************************************** #
#                                                                            #
#   create_images.sh                                                         #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Sun Aug 26 08:15:03 2018                        by elhmn        #
#   Updated: Sun Aug 26 10:25:03 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin/sh

# Usage :
# ./script.sh vmName vmCount

source createSwarmCluster.sh

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

imageExists()
{
	images=$(docker-machine ls -q)

	for i in $(seq 1 $vmCount); do
		if echo $images | grep "$vmName$i" &>/dev/null; then
			return 0
		fi
	done
	return 1
}

createImages()
{
	for i in $(seq 1 $vmCount); do
		docker-machine create --driver virtualbox "$vmName$i"
	done
}


if ! imageExists; then
	createImages
	setupNodes $vmName $vmCount
else
	echo "images already exists"
fi
