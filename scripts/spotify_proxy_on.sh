#! /bin/sh

if pgrep -x "Spotify" > /dev/null
then
  echo "Spotify is running."
  pkill Spotify
else
  echo "Spotify is not running."
fi
sed -i -e "s/network.proxy.mode=1/network.proxy.mode=2/" ~/Library/Application\ Support/Spotify/prefs
