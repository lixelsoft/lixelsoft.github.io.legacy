#!/bin/bash
yellow='\033[1;33m'
NC='\033[0m' # No Color

echo
echo
echo -e "${yellow}   ##       ####  ##    ## ######## ##       ######   #####   ######## ######## "
echo -e "${yellow}   ##        ##    ##  ##  ##       ##      ##       ##    ## ##          ##    "
echo -e "${yellow}   ##        ##     ####   ######   ##       ######  ##    ## ######      ##    "
echo -e "${yellow}   ##        ##    ##  ##  ##       ##            ## ##    ## ##          ##    "
echo -e "${yellow}   ####### ###### ##    ## ######## ######## ######   ######  ##          ##    "
echo
echo


echo -e "${NC}* RUN"


bundle exec jekyll s -H 0.0.0.0 -l