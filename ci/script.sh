#!/bin/bash

set -ex

mkdir -p /tmp/packages

(cd linux && tar -cvzf /tmp/packages/bin-$TRAVIS_COMMIT-linux.tar.gz *)
(cd mac && tar -cvzf /tmp/packages/bin-$TRAVIS_COMMIT-mac.tar.gz *)

(cd win32 && zip -r /tmp/packages/bin-$TRAVIS_COMMIT-win32.zip *)
(cd win64 && zip -r /tmp/packages/bin-$TRAVIS_COMMIT-win64.zip *)
