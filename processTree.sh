#!bin/bash
ps axo comm,pid,ppid,start,user | awk '{print $1 " PID:" $2 " PPID:" $3 " STARTED: " $4 " by:" $5}'
