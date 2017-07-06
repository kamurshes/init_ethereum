mkdir /downloads
cd /downloads
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
apt-get update
apt-get install cuda
