 #!/bin/sh        

num_conn=200

increase_conn=1



while [ $num_conn -lt 1010 ]
do

# make httperf request
	echo "Sending request to load balancer with no of connection: $num_conn request/connection: 2"	 
	httperf --server ANS-LATENCY-BASED-SCALING-LB-1327978742.us-east-1.elb.amazonaws.com --port 80 --uri /gen_rand_no.php --rate 150 --num-conn $num_conn --num-call 1  --timeout 60 	

# Increase no of connection till it reaches 5000, then decrease it gradually to 100 - repeat this cycle
	if [ $increase_conn -eq 1 ]	
	then	
		num_conn=$((num_conn+200))
		echo $num_conn
		
		if [ $num_conn -eq 1000 ]
		then
			increase_conn=0
		fi
	fi

	if [ $increase_conn -eq 0 ]	
	then	
		num_conn=$((num_conn-200))
		echo $num_conn
		
		if [ $num_conn -eq 200 ]
		then
			increase_conn=1
		fi
	fi

# sleep for 1 min
	sleep 1m	
done
