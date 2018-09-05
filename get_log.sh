# ************************************************************************** #
#                                                                            #
#   get_log.sh                                                               #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Wed Sep  5 11:10:33 2018                        by elhmn        #
#   Updated: Wed Sep 05 11:28:12 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin/sh

source docker_utils.sh

LOGDIRNAME=containers_logs

if [ ! -d $LOGDIRNAME ]; then
	echo "$LOGDIRNAME : file creation..."
	mkdir $LOGDIRNAME
	echo "$LOGDIRNAME : file created !"
fi

for e in $(docker container ps -q); do
	name=$e
	container_name=$(get_container_name $e)
	if [ ! -z "$container_name" ]; then
		name=$container_name
	fi
	docker container logs -f $e >> $LOGDIRNAME/container_$name.log &
done
