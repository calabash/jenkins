#!/usr/bin/env bash

trap 'rm -rf calabash-codesign' EXIT

set -e

rm -rf calabash-codesign

TOKEN=$(security find-internet-password -l calabash-ci -w)
git clone --recursive https://calabash-ci:${TOKEN}@github.com/xamarinhq/calabash-codesign.git

(
cd calabash-codesign
apple/create-keychain.sh
)

rm -rf calabash-codesign
