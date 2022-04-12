#!/bin/bash

pwd

set -e

# Set TAG_NAME locally and in github env
TAG_NAME=$(git rev-parse HEAD)
echo "TAG_NAME=$TAG_NAME" >> $GITHUB_ENV

if [ $(git tag -l "bin-$TAG_NAME") ]; then
	echo "Error: Tag already exists!"
	exit 1
fi

# Make the tag
git remote add deploy "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}"
git tag -a "bin-$TAG_NAME" -m "Automated prebuilt binary tag"
git push deply --tags

# Zip up the packages
(cd linux && tar -cvzf bin-linux.tar.gz *)
(cd mac && tar -cvzf bin-mac.tar.gz *)

(cd win32 && 7z a -r bin-win32.zip *)
(cd win64 && 7z a -r bin-win64.zip *)
