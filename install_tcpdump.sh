# ************************************************************************** #
#                                                                            #
#   install_tcpdump.sh                                                       #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Wed Aug 29 15:01:11 2018                        by elhmn        #
#   Updated: Thu Sep 06 14:51:56 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin/sh

source docker_utils.sh

for e in $(get_container_hash); do
	if ! docker exec $e sh -c 'apt-get update && apt-get -y install tcpdump'; then
		 docker exec $e sh -c 'apk update && apk add tcpdump'
	fi
done
