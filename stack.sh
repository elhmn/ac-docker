# ************************************************************************** #
#                                                                            #
#   stack.sh                                                                 #
#                                                                            #
#   By: elhmn <www.elhmn.com>                                                #
#             <nleme@live.fr>                                                #
#                                                                            #
#   Created: Sun Aug 26 08:42:50 2018                        by elhmn        #
#   Updated: Sun Aug 26 09:35:44 2018                        by bmbarga      #
#                                                                            #
# ************************************************************************** #

#!/bin/sh

source remove_stack.sh
source deploy_stack.sh

# Usage :
# ./script.sh command stackName

if [ $# -lt 1 ]; then
	echo usage $0 command stackName
	exit 1
fi

command=$1
stackName=ac_lab
composeFile=docker-compose.yml

if [ ! -z "$2" ]; then
	stackName=$2
fi

if [ ! -z "$3" ]; then
	composeFile=$3
fi

run()
{
	deployStack $1 $2
}

remove()
{
	removeStack $1
}

commandExists()
{
	command=$1
	commands=("run" "remove")
	for cmd in "${commands[@]}"; do
		if [ "$cmd" = "$command" ]; then
			return 0
		fi
	done
	return 1
}

if commandExists $command; then
	$command $stackName $composeFile
else
	echo "$command not supported"
fi
