#!/bin/sh
echo "Usage: upload ftp.example.com user password ./source_dir ./remote_dir"
if [ "$#" -ne 5 ]; then
    echo "Illegal number of parameters"
    exit
fi
lftp -f "
set ftp:ssl-allow off
open $1
user $2 $3
lcd $4
mirror --reverse --delete --verbose $4 $5 --ignore-time --parallel=10 --exclude-glob .git* --exclude .git/ --exclude .well-known/ --exclude cgi-bin/"
