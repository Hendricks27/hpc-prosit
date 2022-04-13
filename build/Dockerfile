FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN apt-get update && apt-get install -y software-properties-common && apt-get install -y python3-pip python-dev && python3 -m pip install --upgrade pip==20.3.4

RUN pip install tensorflow-gpu==1.10.1 keras==2.2.1 h5py tables flask pyteomics==4.1.2 lxml pandas

ENV KERAS_BACKEND=tensorflow
ENV TF_CPP_MIN_LOG_LEVEL=3
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV LD_LIBRARY_PATH = /usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.0/lib64
ENV PATH=$PATH:/usr/local/cuda-9.0/bin
ENV CUDA_HOME=$CUDA_HOME:/usr/local/cuda-9.0

RUN mkdir /root/model_spectra && mkdir /root/model_irt

# !!! Please select the spectra model !!!
ADD hla_cid/* /root/model_spectra/
# ADD hla_hcd/* /root/model_spectra/

# !!! Please select the irt model !!!
# ADD model_fragmentation_prediction/* /root/model_irt/
ADD model_irt_prediction/* /root/model_irt/

ADD prosit/ /root/prosit

RUN chmod -R 777 /root/
RUN cd /root/
WORKDIR /root/


# add rwx to lots of folder
CMD cd /root/model_irt && ls -al
