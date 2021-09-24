#!/bin/bash
cat /03-student/day3/Bash_Homework/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/0312_Dealer_schedule | grep "08:00:00 AM" | awk '{print $1, $2, $5, $6}' >> /03-student/day3/Bash_Homework/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/Dealers_working_during_losses


