#!/bin/sh
echo "Usage: upload ftp.example.com user password ./source_dir ./remote_dir"
lftp -f "
set ftp:ssl-allow off
open $1
user $2 $3
lcd $4
mirror --reverse --delete --verbose $4 $5 --ignore-time --parallel=10 --exclude-glob .git* --exclude .git/"
