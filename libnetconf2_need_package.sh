#!/bin/bash
# libnetconf2 のビルドに必要なパッケージをインストールする (Ubuntu 24.04 想定)
#   C compiler / cmake >= 3.5.0 / crypt(3)
#   libssh >= 0.9.5 / OpenSSL >= 3.0.0 / curl >= 7.30.0
# libyang は別途 clone してビルドすること (libpcre2-dev, libxxhash-dev はそのビルド用)
set -eu

sudo apt update
sudo apt install -y build-essential cmake git pkg-config \
		    libcrypt-dev \
		    libssh-dev \
		    libssl-dev \
		    libcurl4-openssl-dev \
		    libpcre2-dev libxxhash-dev \
		    libpam0g-dev

echo "---- installed versions ----"
gcc --version | head -1
cmake --version | head -1
pkg-config --modversion libssh   | sed 's/^/libssh   /'
pkg-config --modversion openssl  | sed 's/^/openssl  /'
pkg-config --modversion libcurl  | sed 's/^/libcurl  /'
