#!/usr/bin/env bash

APPS=$(osascript -e 'tell application "System Events" to get name of (processes where background only is false)')

IFS=',' read -r -a AppsArray <<< "$APPS"

for app in "${AppsArray[@]}"
do
  app=$(echo "$app" | sed 's/^ *//g')

  if [ "$app" = "Finder" ]; then
    echo "Will not quit Finder"
  elif [ "$app" = "Terminal" ]; then
    echo "Will not quit Terminal"
  else
    echo "Will quit $app"
    killall -KILL $app
  fi
done
