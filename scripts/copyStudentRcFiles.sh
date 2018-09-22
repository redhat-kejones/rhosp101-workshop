#!/usr/bin/env bash

for i in {16..20}; do
  scp /home/stack/student${i}rc student${i}@192.168.1.77:;
done
