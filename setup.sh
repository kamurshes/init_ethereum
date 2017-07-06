sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y ethereum
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ethereum/ethereum
sudo sed 's/jessie/Xenial/' -i /etc/apt/sources.list.d/ethereum-ethereum-*.list
sudo apt-get update
sudo apt-get install -y ethereum ethminer geth
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get install -y nvidia-375
