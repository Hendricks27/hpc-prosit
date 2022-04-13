# hpc-prosit
Use [Prosit](https://github.com/kusterlab/prosit) with HPC environment.


## How to use it
### Build process
1. Download desired model files to [build folder](./build)
2. Modify [Dockerfile](./build/Dockerfile)
3. Run following command
```
cd /PathToThisRepo/hpc-prosit/build
docker built -t RepoName/Prosit:Version ./
```
### Server side
1. Modify [start.sh](./server/start.sh), use the correct path for log and standard error
2. Run following command
```
cd /PathToThisRepo/hpc-prosit/server
./start.sh
```
3. Wait until the job is started, and check whether flask is started by looking at log file
4. Use "bjobs -l" to find out which execution node is used

### Client side
1. Run 
```
ssh -L 8008:compute1-exec-<exec_node_num>.ris.wustl.edu:8008 <your_wustl_key>@compute1-client-1.ris.wustl.edu
```
See [Port forward](https://docs.ris.wustl.edu/doc/compute/recipes/port-forwarding-gui.html?highlight=port) and [Port expose](https://docs.ris.wustl.edu/doc/compute/recipes/job-execution-examples.html?highlight=port#expose-ports-from-within-containers) for more detail
2. Open a new terminal and try
```
cd /PathToThisRepo/hpc-prosit/client
curl -F "peptides=@peptidelist.csv" http://127.0.0.1:8008/predict/generic > generic.tsv
curl -F "peptides=@peptidelist.csv" http://127.0.0.1:8008/predict/msp > msp.tsv
curl -F "peptides=@peptidelist.csv" http://127.0.0.1:8008/predict/msms > msms.tsv
```

## What I modified
1. Docker build process
   1. Use Nvidia/CUDA instead of Tensorflow as base image
   2. Installation of the dependencies. 
   3. Pack the model files into the docker container
2. Python files
   1. Change import behavior
   2. Change ports used in flask. 
3. 





