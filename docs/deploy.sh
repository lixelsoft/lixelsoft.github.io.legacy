#!/bin/bash

echo "*****************************"
echo "*********** Start ***********"
echo "*****************************"

bundle exec jekyll serve --trace

rm -rf docs
mkdir docs

cp -rf ./_site/* ./docs

git add .

git commit -m "[$(date +%Y%m%d)] Update"

git push

echo "*****************************"
echo "***********  END  ***********"
echo "*****************************"