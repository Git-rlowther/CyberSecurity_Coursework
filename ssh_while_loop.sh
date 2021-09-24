#! /bin/bash


##Command and loops for Kibana testing
## Ryan Lowther 9-24-21


##Single command to run on command line
##this command will continuously attempt to login to host 10.0.0.9 with user rlazadmin. Unless ran from the Ansible ##container it will not have the correct SSH key to authenticate, and fail
##while [ true ]; do ssh rlazadmin@10.0.0.9; done


##While loop to attempt ssh login to each server

while [ true ];
do
        ssh rlazadmin@10.0.0.9
        ssh rlazadmin@10.0.10
        ssh rlazadmin@10.1.0.4

done