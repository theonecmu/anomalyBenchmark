#!/bin/sh
period=60
method=cpu
endhour=4

if [ $# -ge 1 ]
then
	method=$1
fi

if [ $# -ge 2 ]
then
	period=$2
fi

if [ $# -ge 3 ]
then
	endhour=$3
fi

echo "Method: $method"
echo "Period: $period"
echo "End Hour: $endhour"

endday=$(date "+%d")

if [ $(date "+%H") -gt $endhour ]; then
	endday=$((endday+1))
	echo "Increase end day to tomorrow date $endday !!!"
fi

echo "End Day: $endday"

while [ $(date "+%H") -lt $endhour ] || [ $(date "+%d") -lt $endday ];
do
	if [ $method = cpu ]; then
		echo "--------- stress server cpu for $period seconds -------"
        	stress --cpu 8 --timeout $period
	elif [ $method = io ]; then
		echo "--------- stress server io for $period seconds -------"
        	stress --io 4 --timeout $period
	elif [ $method = mem ]; then
		echo "--------- stress server memory for $period seconds -------"
        	stress --vm 2 --timeout $period
	elif [ $method = bw ]; then
		echo "--------- stress server bandwidth for $period seconds -------"
        	sudo wondershaper eth0 1048576 4096
		sleep $period
        	sudo wondershaper eth0 1048576 1048576
	else
		echo "Unknown method $method ! Please use cpu/io/mem/bw and specify the period as the second argument! (Default is 1 minute!)"
		break
	fi
        echo "--------- Server without any stress for $period seconds -------"
        sleep $period
done
echo "--------- Periodical $method stressing with period $period seconds finished at $(date) !! -------"
if [ $method = bw ]; then
	echo "Reset network throttling!"
	sudo wondershaper eth0 1048576 1048576
fi
