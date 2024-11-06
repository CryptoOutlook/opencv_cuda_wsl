<<comments

# ******************************
#
# CUDA Toolkit 12.1 Installation
# 
# Using linux run file
# 
# ******************************

mkdir -p /home/Downloads

cd /home/Downloads


wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda_12.1.1_530.30.02_linux.run

cp /mnt/d/docker/wsl/cuda_12.1.1_530.30.02_linux.run .

sh cuda_12.1.1_530.30.02_linux.run

comments

# **************************************************************************************************************
# **************************************************************************************************************
# **************************************************************************************************************

# ******************************
#
# CUDA Toolkit 12.1 Installation
# 
# Using deb file
# 
# ******************************

mkdir -p /home/Downloads


cd /home/Downloads

wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin

mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600

# *****************************
# Download from nvidia website
# *****************************
# wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda-repo-wsl-ubuntu-12-1-local_12.1.1-1_amd64.deb


# *****************************
# copy downloaded file
# *****************************
cp /mnt/d/docker/wsl/cuda-repo-wsl-ubuntu-12-1-local_12.1.1-1_amd64.deb .

dpkg -i cuda-repo-wsl-ubuntu-12-1-local_12.1.1-1_amd64.deb

cp /var/cuda-repo-wsl-ubuntu-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/

apt-get update

apt-get -y install cuda

echo '' >> /root/.bashrc
echo '' >> /root/.bashrc
echo 'export PATH="/usr/local/cuda-12.1/bin:$PATH"' >> /root/.bashrc
echo '' >> /root/.bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda-12.1/lib64:$LD_LIBRARY_PATH"' >> /root/.bashrc
echo '' >> /root/.bashrc
