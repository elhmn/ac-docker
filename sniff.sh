# ************************************************************************** #
#                                                                            #
#   sniff.sh                                                                 #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Wed Aug 29 15:00:56 2018                        by elhmn        #
#   Updated: Wed Sep 05 11:29:41 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin

source docker_utils.sh

LOGDIRNAME=tcp_logs

if [ ! -d $LOGDIRNAME ]; then
	echo "$LOGDIRNAME : file creation..."
	mkdir $LOGDIRNAME
	echo "$LOGDIRNAME : file created !"
fi

for e in $(get_container_hash); do
	name=$e
	container_name=$(get_container_name $e)
	if [ ! -z "$container_name" ]; then
		name=$container_name
	fi

	if [ ! -z "$container_name" ]; then
		echo "start sniffing from $container_name"
		docker exec $e sh -c "tcpdump -A -i any" >> ./$LOGDIRNAME/container-"$container_name".log &
	fi
done
