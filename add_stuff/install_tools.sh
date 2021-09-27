#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y vim wget net-tools locales bzip2 \
    python-numpy #used for websockify/novnc
#apt-get -y install git gcc curl make libxml2-utils flex m4 openjdk-8-jdk lib32stdc++6 libelf-dev libssl-dev python-enum34 python-mako syslinux-utils software-properties-common
apt-get clean -y

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8

apt install --fix-missing -y vim wget ca-certificates  pulseaudio xrdp\
  xauth supervisor uuid-runtime locales \
  openssh-server sudo git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev \
  nano python3-pip  xvfb \
  python3-pip  locate  libxml2-dev libxslt1-dev libssl-dev libmicrohttpd-dev  \
  libmysqlclient-dev byobu locate cron  python3-pyaudio ffmpeg \
  fonts-liberation libappindicator3-1 libfile-basedir-perl libfile-desktopentry-perl libfile-mimeinfo-perl \
  libindicator3-7  libipc-system-simple-perl libnet-dbus-perl libtie-ixhash-perl libx11-protocol-perl \
  libxml-parser-perl libxml-twig-perl libxml-xpathengine-perl xdg-utils  xserver-xephyr jq tor xarchiver libavcodec-extra vlc
apt-get clean -y
pip3 install pymysql pyvirtualdisplay faker-e164 Faker PySocks stem  bs4 selenium  ConfigParser lxml  speechrecognition requests pyvirtualdisplay pydub




wget https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 && tar -xvf firefox-53.0b9.tar.bz2 -C /headless/
