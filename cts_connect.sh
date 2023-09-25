#!/usr/bin/env bash
[ "$1" == "start" ] && cts connect -auto &
sleep 10
while true :
do
        ss -ua | grep "IP_ADDRESS:PORT" &>/dev/null
        if
                [ $? -eq 0 ]
        then
                :
        else
                cts disconnect && cts connect -auto &
        fi
        sleep 1s
done


[ "$1" == "stop" ] && cts disconnect
sleep 1s
