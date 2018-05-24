#!/usr/bin/env bash

trap 'rm -rf calabash-codesign' EXIT

set -e

rm -rf calabash-codesign
git clone --recursive git@github.com:calabash/calabash-codesign.git

(
cd calabash-codesign
apple/create-keychain.sh
)

rm -rf calabash-codesign
