#!/usr/bin/env sh

set -ex

echo "Generating bintray config..."
sed -e "s/\$VERSION_NAME/$TRAVIS_COMMIT/" ci/bintray.template.json > ci/bintray.json