#!/bin/bash

getMemUsage(){
  [ -f /proc/meminfo ] && {
    Buffers=`grep -we 'Buffers' /proc/meminfo | cut -d' ' -f2- | tr -d "[A-Z][a-z] "`
    Cached=`grep -we 'Cached' /proc/meminfo | cut -d' ' -f2- | tr -d "[A-Z][a-z] "`
    MemFree=`grep -ie 'MemFree' /proc/meminfo | cut -d' ' -f2- | tr -d "[A-Z][a-z] "`
    MemTotal=`grep -ie 'MemTotal' /proc/meminfo | cut -d' ' -f2- | tr -d "[A-Z][a-z] "`
  }
  MEMUSED="$(( ( ( ( $MemTotal - $MemFree ) - $Cached ) - $Buffers )))"
  MEMTOTAL="$(( $MemTotal ))"
  MEMFREE="$(( $MEMTOTAL - $MEMUSED ))"

  USAGE="$((100*MEMUSED/MEMTOTAL))"

  echo "$USAGE"
}
