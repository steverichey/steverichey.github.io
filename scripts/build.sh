#!/usr/bin/env bash
set -e # halt script on error

bundle install
bundle exec jekyll build

# Verify site (ignored for now)
# bundle exec htmlproof ./_site
