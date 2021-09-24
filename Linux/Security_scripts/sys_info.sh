#!/bin/bash
(echo -e "\nSystem Info\n"
echo -e "\nToday's date and time are:  $(date)\n"
echo -e "\nYou are logged in to: $(uname -a)\n"
echo -e "\nYour station IP Address is: $(hostname -I)\n"
echo -e "\nYour host name is: $(hostname -s)\n"
echo -e "\nYour DNS info is:\n" 
systemd-resolve --status | grep "DNS Server" 
echo -e "\nYour system memory info is:\n"
free
echo -e "\nYour CPU info:\n"
lscpu | grep CPU
echo -e "\nYour disk usage stats are:\n"
df -H | head -2
echo -e "\nYou are logged in as : $(who)\n"
mkdir -p ~/research >> ~/research/sys_info.txt
echo -e "\nExecutable files located in /home/*\n"
sudo find /home/* -type f -perm 777 >> ~/research/sys_info.txt
top | head -n 17 >> ~/research/sys_info.txt) >> ~/research/sys_info.txt

exit

