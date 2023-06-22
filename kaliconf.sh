
#!/bin/bash

# sleep until instance is ready
#until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
 #   sleep 5
#done

# Update Package Manager
apt update

apt full-upgrade -y 

sleep 5 

# Install Kali Linux Meta Packages
DEBIAN_FRONTEND=noninteractive apt install -y kali-linux-default

sleep 10

apt update 

export DEBIAN_FRONTEND=dialog 

apt update 

# Install Remote Desktop
apt-get install -y kali-desktop-xfce xorg xrdp

sleep 5

apt update 

# Enable Remote Desktop 
systemctl enable xrdp --now

pip install --upgrade pip

# Install Pacu
apt install -y pacu

apt update

sleep 5

# Install Cloudsplaining
pip3 install --user cloudsplaining

apt update

sleep 5

# Install S3Scanner
apt install -y s3scanner

# Install npm
apt install -y npm 

apt update 

# Clone LazyS3 to /home/kali
git clone https://github.com/Den1al/PyLazyS3.git

# Clone CloudSploit to /home/kali
git clone https://github.com/aquasecurity/cloudsploit.git

# Install ScoutSuite 
virtualenv -p python3 venv
source venv/bin/activate
pip install scoutsuite

# Set kali password to 'kali'
echo "kali:kali" | sudo chpasswd 

apt update


