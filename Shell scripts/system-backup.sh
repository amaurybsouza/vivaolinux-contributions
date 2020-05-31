#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   system-backup.sh 
# Description:   Backup from /etc directory
# Site:          https://medium.com/@amaurybsouza
# Written by:    Amaury Souza
# Maintenance:   Amaury Souza
# ------------------------------------------------------------------------ #
# Usage:         
#       $ ./system-backup.sh
# ------------------------------------------------------------------------ #
# Tested on:  
#       Bash 4.2.46
# ------------------------------------------------------------------------ # 
# History:        v1.0 30/05/2020, Amaury:
#                - Start de program
#                - Add function
#                v1.1 30/05/2020, Amaury:
#                - Adding new variables
#                v1.2 30/05/2020, Amaury:
#                - Executing new tests in my system
# ------------------------------------------------------------------------ #
# Thankfulness: Amaury Souza
#
#VARIABLES --------------------------------------------------------------- #
data=`date +%d-%m-%y-%H:%M`
bkp_source=/etc
bkp_dest=/backup
#FUNCTIONS --------------------------------------------------------------- #
compact() {
	tar -cjvf $bkp_dest/bkp-$data-usr.tar.bz2 $bkp_source
}
#CODE -------------------------------------------------------------------- #
if [ -d $bkp_dest ]
then
	compact
else
	if [ -f $bkp_dest ]
	then
		echo "Impossible! $bkp_dest is a file"
	else
		mkdir $bkp_dest
		compact
	fi
fi
#FINISHED ---------------------------------------------------------------- #
