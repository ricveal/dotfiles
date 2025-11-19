# More info could be found here:
# https://github.com/mczachurski/wallpapper

IMG_URL="https://cdn.dynamicwallpaper.club/wallpapers/g3ew7aqqlb/Cyberpunk%202077.heic"
DESTINATION="$HOME/Pictures/wallpaper.heic"

curl -o "$DESTINATION" "$IMG_URL"
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$DESTINATION"'"'
