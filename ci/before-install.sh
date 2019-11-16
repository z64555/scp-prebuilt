#!/bin/bash

declare -r SSH_FILE="$(mktemp -u $HOME/.ssh/XXXXX)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Decrypt the file containing the private key
openssl aes-256-cbc \
	-K $encrypted_d05d0ea6134f_key -iv $encrypted_d05d0ea6134f_iv \
	-in ".travis/travis_deploy_key.enc" \
	-out "$SSH_FILE" -d

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Enable SSH authentication
chmod 600 "$SSH_FILE" \
	&& printf "%s\n" \
		"Host github.com" \
		"  IdentityFile $SSH_FILE" \
		"  LogLevel ERROR" >> ~/.ssh/config
		
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"