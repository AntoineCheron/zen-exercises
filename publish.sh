#!/bin/sh

git checkout gh-pages
rm -rf ./*
git reset --hard master
git submodule update
hugo
rm -rf archetypes content data i18n themes .gitmodules config.toml publish.sh README.md
cp -a ./public/. .
rm -rf public
git add .
git commit -m "Publishing to gh-pages"
git push --force origin gh-pages
git checkout master
git submodule update
