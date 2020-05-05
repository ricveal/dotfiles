#! /bin/sh
echo "resetting proxy"
export http_proxy=
export https_proxy=

echo "resetting git proxy..."
git config --global --unset http.proxy > /dev/null 2>&1
git config --global --unset https.proxy > /dev/null 2>&1

echo "resetting npm proxy..."
npm config rm proxy > /dev/null 2>&1
npm config rm https-proxy > /dev/null 2>&1
