#!/bin/bash

INTERVAL=60   
ITERATIONS=5  

for ((i:=1;i<=ITERATIONS;i++)); do
    echo "Iteration $i: Checking high CPU processes..."
    PIDS=$(ps -eo pid,pcpu --no-headers | awk '$2>80 {print $1}')
    for pid in $PIDS; do
        echo "Killing process $pid consuming high CPU"
        kill -9 $pid
    done
    
    sleep $INTERVAL
done
