#!/bin/bash

export host="${STATSD_HOST:-127.0.0.1}"
export port="${STATSD_PORT:-8125}"
export interval=10
#set a meaningful prefix - right now this is set to the hostname.
export prefix=`hostname`

set -u # Exit if any variables are uninitialised.
set -e # Exit if any command returns non-zero.

source ./sender.sh
source ./cpu.sh
source ./mem.sh

while :
do
  cpu=$(getCPUUsage)
  sendGauge $prefix'.cpu.usage:'$cpu'|g'
  mem=$(getMemUsage)
  sendGauge $prefix'.mem.usage:'$mem'|g'
  # echo $prefix'.mem.usage'$mem'|g'
  # echo $prefix'.cpu.usage'$cpu'|g'
  sleep $interval
done
