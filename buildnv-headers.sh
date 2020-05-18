!/bin/bash

CWD=$(pwd)
PACKAGES="$CWD/packages"
WORKSPACE="$CWD/workspace"
LDFLAGS="-L${WORKSPACE}/lib -lm"
CFLAGS="-I${WORKSPACE}/include"
PKG_CONFIG_PATH="${WORKSPACE}/lib/pkgconfig"

installLibs(){
echo "Installing prerequisites"
sudo apt-get update
sudo apt-get -y --force-yes install autoconf automake build-essential libass-dev libfreetype6-dev libgpac-dev \
  libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
 libxcb-xfixes0-dev pkg-config texi2html zlib1g-dev
}

#Install nvidia SDK
installSDK(){
echo "Installing the nVidia NVENC SDK."
cd ffmpeg_build
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers
make PREFIX=${WORKSPACE}
make PREFIX=${WORKSPACE} install
}

installLibs
installSDK
echo " NV-Headers Complete!"
