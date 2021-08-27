#!/bin/bash

echo "******************************"
echo "Start"
echo "******************************"

bundle exec jekyll serve --trace

git add .

git commit -m "[$(date +%Y%m%d)] Update"

git push


echo "******************************"
echo "End"
echo "******************************"