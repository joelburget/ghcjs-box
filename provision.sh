#!/bin/bash

export PATH=/home/vagrant/.cabal/bin:/home/vagrant/bin$PATH

# install node
wget 'http://nodejs.org/dist/v0.12.2/node-v0.12.2-linux-x64.tar.gz'
tar xf node-v0.12.2-linux-x64.tar.gz
cd bin
ln -s ../node-v0.12.2-linux-x64/bin/node node
ln -s ../node-v0.12.2-linux-x64/bin/npm npm
cd

# install system dependencies (llvm requires special care)
/etc/apt/sources.list <<EOF
deb http://llvm.org/apt/jessie/ llvm-toolchain-jessie-3.6 main
deb-src http://llvm.org/apt/jessie/ llvm-toolchain-jessie-3.6 main
EOF
apt-get update
apt-get install autoconf libtinfo5 libtinfo-dev alex happy llvm-3.6 git

# install ghc
# TODO This script is really for ghc 7.10.2, which doesn't yet exist
wget https://www.haskell.org/ghc/dist/7.10.1/ghc-7.10.1-x86_64-unknown-linux-deb7.tar.xz
tar xf ghc-7.10.1-x86_64-unknown-linux-deb7.tar.xz
cd ghc-7.10.1/
./configure
./configure --prefix=/opt/ghc-7.10.1
make install

# install ghcjs
git clone https://github.com/seereason/haskell-src-meta
git clone https://github.com/seereason/ansi-wl-pprint --branch pr-base48
git clone https://github.com/seereason/wl-pprint-text
git clone https://github.com/seereason/stringsearch
cabal install  ./haskell-src-meta ./ansi-wl-pprint ./wl-pprint-text ./stringsearch
cabal install -f-old-time tar
git clone https://github.com/haskell/haddock.git
cabal install --allow-newer ./haddock/haddock-api ./haddock/haddock-library
git clone https://github.com/ghcjs/ghcjs-prim.git
git clone https://github.com/ghcjs/ghcjs.git
cabal install ./ghcjs ./ghcjs-prim
ghcjs-boot --dev --ghcjs-boot-dev-branch ghc-7.10
