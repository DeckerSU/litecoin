#!/bin/bash
# LTC & 3P Coins build script for Ubuntu & Debian (c) Decker
make -C ${PWD}/depends v=1 NO_PROTON=1 NO_QT=1 HOST=$(depends/config.guess) -j$(nproc --all)

./autogen.sh

CXXFLAGS="-g0 -O2" \
CONFIG_SITE="$PWD/depends/$(depends/config.guess)/share/config.site" ./configure --disable-tests --disable-bench --without-miniupnpc --enable-experimental-asm --with-gui=no --disable-bip70

make V=1 -j$(nproc --all)
sudo ln -sf /home/$USER/litecoin/src/litecoin-cli /usr/local/bin/litecoin-cli
sudo ln -sf /home/$USER/litecoin/src/litecoind /usr/local/bin/litecoind
