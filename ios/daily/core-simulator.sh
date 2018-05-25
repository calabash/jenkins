#!/usr/bin/env bash

rm -rf /Users/jenkins/Library/Logs/CoreSimulator
mkdir -p /Users/jenkins/Library/Logs/CoreSimulator

gem install run_loop

developer_dirs=(
"/Xcode/8.3.3/Xcode.app/Contents/Developer"
"/Xcode/9.2/Xcode.app/Contents/Developer"
)

for directory in ${developer_dirs[@]}; do
  DEVELOPER_DIR="${directory}" run-loop simctl doctor --debug
done
