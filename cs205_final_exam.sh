#!/usr/bin/env bash

awk '{print FILENAME}' $1

awk '{print "Total Pokemon: "}' $1
awk '{print NR}' $1
awk '{print "Avg. HP: "}' $1
awk '{sum += $6}' $1
awk '{print sum2 / NR}' $1 
awk '{print "Avg. Attack: "}' $1
awk '{sum2 += $7} {print sum2 / NR}' $1



