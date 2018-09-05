# ************************************************************************** #
#                                                                            #
#   docker_utils.sh                                                          #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created:                                                 by elhmn        #
#   Updated: Wed Sep 05 11:24:01 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin/sh

get_container_name()
{
	docker container inspect $1 | grep \"name\" | sed 's/".*".*:.*"\(.*\)".*/\1/g' | sed 's/[ $]//g'
}

get_container_hash()
{
	docker container ps | cut -d ' ' -f 1 | sed 's/^[A-Z]*$//g'
}
