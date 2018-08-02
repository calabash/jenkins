#!/usr/bin/env bash

trap 'gem install run_loop' ERR

set -e

rm -rf /Users/jenkins/Library/Logs/CoreSimulator
mkdir -p /Users/jenkins/Library/Logs/CoreSimulator

gem uninstall -Vax --force --no-abort-on-dependent run_loop
rm -rf run_loop
git clone git@github.com:calabash/run_loop.git
(cd run_loop; rake install)

developer_dirs=(
"/Xcode/9.4.1/Xcode.app/Contents/Developer"
"/Xcode/10.0/Xcode.app/Contents/Developer"
)

for directory in ${developer_dirs[@]}; do
  DEVELOPER_DIR="${directory}" run-loop simctl doctor --debug
done
