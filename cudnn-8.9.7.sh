# ************************
#
# CUDNN 8.9.7 Installation
# 
# ************************


mkdir -p /home/Downloads

cd /home/Downloads

cp /mnt/d/docker/wsl/cudnn-linux-x86_64-8.9.7.29_cuda12-archive.tar.xz .

tar -xvf cudnn-linux-x86_64-8.9.7.29_cuda12-archive.tar.xz

cp cudnn*/include/cudnn*.h /usr/local/cuda-12.*/include

cp cudnn*/lib/libcudnn* /usr/local/cuda-12.*/lib64

chmod a+r /usr/local/cuda-12.*/include/cudnn*.h /usr/local/cuda-12.*/lib64/libcudnn*

