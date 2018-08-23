# ************************************************************************** #
#                                                                            #
#   create_cluster.sh                                                        #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created:                                                 by elhmn        #
#   Updated: Sun Aug 26 10:13:15 2018                        by bmbarga      #
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

setupNodes $vmName $vmCount
