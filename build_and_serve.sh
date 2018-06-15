#!/usr/bin/env bash
rm -rf ./_site
scripts/cibuild
bundle exec jekyll serve -VIlt