#!/bin/bash

getCPUUsage(){
  read cpu a b c prev_idle rest < /proc/stat
  prev_total=$((a+b+c+prev_idle))

  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))

  CPU=$((100*((total - prev_total) - (idle - prev_idle))/(total - prev_total)))

  echo "$CPU"
}
