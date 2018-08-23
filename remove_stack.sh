# ************************************************************************** #
#                                                                            #
#   remove_stack.sh                                                          #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Sun Aug 26 08:21:49 2018                        by elhmn        #
#   Updated: Sun Aug 26 09:11:56 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin/sh

# Usage :
# ./script.sh stackName

removeStack()
{
	stackName=ac_lab

	if [ ! -z "$1" ]; then
		stackName=$1
	fi

	if docker stack ls | cut -d' ' -f1 | grep $stackName; then
		docker stack rm $stackName
	else
		echo "$stackName does not exit"
	fi
}
