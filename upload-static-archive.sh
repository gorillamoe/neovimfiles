#!/bin/sh


echo 'Enter username and press enter:'
read UPLOAD_USER
echo 'Enter hostname and press enter:'
read UPLOAD_HOST
echo 'Enter port and press enter:'
read UPLOAD_PORT
echo 'Enter upload directory and press enter:'
read UPLOAD_DIR

SCRIPT_BASEPATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $SCRIPT_BASEPATH

tar -zcvf vimfiles.tar.gz --exclude "install.sh" --exclude "upload-static-archive.sh" --exclude "vimfiles.tar.gz" --exclude "*.git*" --exclude "*.log*" .
scp -P ${UPLOAD_PORT} vimfiles.tar.gz ${UPLOAD_USER}@${UPLOAD_HOST}:${UPLOAD_DIR}
