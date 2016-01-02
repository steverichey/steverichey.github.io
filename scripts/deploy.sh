#!/usr/bin/env bash
set -e # halt script on error

cd ./_site && find . -type f -exec curl -u $FTP_USER:$FTP_PW \
--ftp-create-dirs -T {} ftp://kristinrichey.com/{}
