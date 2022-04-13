#!/bin/bash


LSF_DOCKER_PORTS='8008:8008' bsub \
  -g /d.goldfarb/compute \
  -G compute-d.goldfarb \
  -a 'docker(wenjin27/prosit:test)' \
  -J prosit-server \
  -R 'select[ gpuhost, mem>20000, tmp>20, port8090=1 ] rusage[mem=20000, tmp=20] span[hosts=1]' \
  -q general \
  -n 10 \
  -M 20GB \
  -gpu 'num=1:gmodel=TeslaV100_SXM2_32GB:j_exclusive=yes' \
  -o /storage1/fs1/d.goldfarb/Active/Projects/Wenjin/code/hpc-prosit/server/start.%J.log \
  -e /storage1/fs1/d.goldfarb/Active/Projects/Wenjin/code/hpc-prosit/server/start.%J.err \
  python3 server.py

