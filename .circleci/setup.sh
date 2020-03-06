#!/bin/sh
set -e

# Configure git.
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global hub.protocol "https"

# Configure hub.
mkdir -p ~/.config
printf "github.com:\n- user: $GITHUB_LOGIN\n  oauth_token: $GITHUB_TOKEN\n  protocol: https\n" > ~/.config/hub
printf "machine github.com\nlogin $GITHUB_LOGIN\npassword $GITHUB_TOKEN\n" > ~/.netrc

# Install autofix and its dependencies.
brew install hub
pip install codespell
npm install -g autofix
