#!/bin/bash



LSF_DOCKER_PORTS='8008:8008' bsub -g /d.goldfarb/compute -G compute-d.goldfarb -a 'docker(wenjin27/prosit:test)' -J wenjintest -R 'select[ gpuhost, mem>32000, tmp>20, port8090=1 ] rusage[mem=32000, tmp=20] span[hosts=1]' -q general -n 10 -M 32GB -gpu 'num=1:gmodel=TeslaV100_SXM2_32GB:j_exclusive=yes' -o /storage1/fs1/d.goldfarb/Active/Projects/Wenjin/code/prosit/xtest.%J.log -e /storage1/fs1/d.goldfarb/Active/Projects/Wenjin/code/prosit/xtest.%J.err python3 server.py

# ssh -L 8008:compute1-exec-205.ris.wustl.edu:8008 wenjin@compute1-client-1.ris.wustl.edu




