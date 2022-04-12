#!/bin/bash

pwd

set -e

# Set TAG_NAME locally and in github env
TAG=$(git rev-parse HEAD)
TAG_NAME="bin-${TAG::7}"	# Get just the first 7 characters of the SHA-1
echo "TAG="$TAG
echo "TAG_NAME="$TAG_NAME
echo "TAG_NAME=$TAG_NAME" >> $GITHUB_ENV

if [ $(git tag -l $TAG_NAME) ]; then
	echo "Error: Tag already exists!"
	exit 1
fi

# Make the tag
git config --global user.email "SirKnightlySCP@gmail.com"
git config --global user.name "SirKnightly"

git remote add deploy "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}"
git tag -a "$TAG_NAME" -m "Automated prebuilt binary tag"
git push deploy --tags

# Zip up the packages
(cd linux && tar -cvzf bin-linux.tar.gz *)
(cd mac && tar -cvzf bin-mac.tar.gz *)

(cd win32 && 7z a -r bin-win32.zip *)
(cd win64 && 7z a -r bin-win64.zip *)
