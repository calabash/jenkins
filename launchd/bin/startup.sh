#!/usr/bin/env bash

# Install to /Users/jenkins/bin/launchd/startup.sh

set -e

DIR=/Users/jenkins/tmp/calabash-codesign
rm -rf "${DIR}"

TOKEN=$(security find-generic-password -l calabash-ci -w)

git clone --recursive \
  https://calabash-ci:${TOKEN}@github.com/xamarinhq/calabash-codesign.git \
  "${DIR}"

(
cd "${DIR}"
apple/create-keychain.sh
)

rm -rf "${DIR}"
