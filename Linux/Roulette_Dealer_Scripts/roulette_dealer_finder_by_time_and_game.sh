#!/bin/bash


#####Roulette
#####Texas_Hold_Em
#####BlackJack
case $3 in
	BlackJack)
		grep "$2" $1* | awk '{print $1, $2, $3, $4 }'
		;;
	Roulette)
		grep "$2" $1* | awk '{print $1, $2, $5, $6 }'
		;;
	Texas)
		grep "$2" $1* | awk '{print $1, $2, $7, $8 }'
		;;
esac



##if [ $3 == BlackJack ]
#	then grep "$2" $1* | awk '{print $1, $2, $3, $4 }'
#elif [ $3 == Roulette ]
#	then grep "$2" $1* | awk '{print $1, $2, $5, $6 }'
#elif [ $3 == Texas ]
#	then grep "$2" $1* | awk '{print $1, $2, $7, $8 }'
##else 
##	echo "Not Found"
##fi

