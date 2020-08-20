#!/usr/bin/env bash

wid=$1
class=$2
instance=$3

if [[ "$class" == conky ]] || [[ "$class" == GLava ]]; then
  echo manage=off
  xdo lower $wid
fi
