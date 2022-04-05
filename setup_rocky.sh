#!/bin/sh


dnf upgrade --refresh -y
dnf install epel-release -y
dnf upgrade --refresh -y

rpm --import https://packages.microsoft.com/keys/microsoft.asc -y
touch /etc/yum.repos.d/vscode.repo 
echo "[code] 
name=Visual Studio Code 
baseurl=https://packages.microsoft.com/yumrepos/vscode 
enabled=1 
gpgcheck=1 
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo
dnf install code -y




dnf install epel-release libpng15 libpcre16.so.0 libGLU.so.1 qt5-qtbase-gui libnsl snapd -y 
systemctl enable --now snapd.socket
snap install snap-store


dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-rhel8.repo -y
dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r) -y
dnf install nvidia-driver nvidia-settings
dnf install cuda-driver
