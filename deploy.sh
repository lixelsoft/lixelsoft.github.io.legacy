#!/bin/bash

echo "******************************"
echo "Start"
echo "******************************"


git add .

git commit -m "[$(date +%Y%m%d)] Update"

git push


echo "******************************"
echo "End"
echo "******************************"