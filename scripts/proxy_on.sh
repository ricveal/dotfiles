#! /bin/sh

source ../work_variables.zsh

proxy=$WORK_PROXY

echo "exporting proxy"
export http_proxy=$proxy
export https_proxy=$proxy

echo "setting git proxy to $proxy"
git config --global http.proxy $proxy
git config --global https.proxy $proxy

echo "setting npm proxy to $proxy"
npm config set proxy $proxy
npm config set https-proxy $proxy
