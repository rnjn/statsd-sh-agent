#!/bin/bash
sendGauge(){
  if [ $# -ne 1 ]
  then
    echo "Syntax: $0 '<gauge_data_for_statsd>'"
    exit 1
  fi

  exec 3<> /dev/udp/$host/$port
  # Send data
  printf "$1" >&3
  # Close UDP socket
  exec 3<&-
  exec 3>&-
}
