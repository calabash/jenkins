#!/usr/bin/env bash

trap 'gem install run_loop' EXIT

set -e

rm -rf /Users/jenkins/Library/Logs/CoreSimulator
mkdir -p /Users/jenkins/Library/Logs/CoreSimulator

gem uninstall -Vax --force --no-abort-on-dependent run_loop
rm -rf run_loop
git clone git@github.com:calabash/run_loop.git
(cd run_loop; rake install)

# At the moment, Xcode 8.3.3 is the active (default) Xcode.
# Xcode 8.3.3 is aware of iOS 11.0 and 11.1 simulators, so
# the doctor command will touch those simulators.
#
# Xcode 9.2 will launch the same simulators as Xcode 8.3.3
# _and_ iOS 11.2 simulators.
#
# I think it is safe to run doctor against Xcode 9.2 and
# skip running against Xcode 8.3.3.
developer_dirs=(
"/Xcode/9.2/Xcode.app/Contents/Developer"
)

for directory in ${developer_dirs[@]}; do
  DEVELOPER_DIR="${directory}" run-loop simctl doctor --debug
done
