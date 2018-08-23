# ************************************************************************** #
#                                                                            #
#   deploy_stack.sh                                                          #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Sun Aug 26 08:30:08 2018                        by elhmn        #
#   Updated: Sun Aug 26 09:11:43 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin/sh

# Usage :
# ./script.sh stackName composeFile

deployStack()
{
	stackName=ac_lab
	composeFile=docker-compose.yml

	if [ ! -z "$1" ]; then
		stackName=$1
	fi

	if [ ! -z "$2" ]; then
		composeFile=$2
	fi

	docker stack deploy -c $composeFile $stackName
}
