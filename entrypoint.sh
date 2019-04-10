#!/bin/bash
echo "Usage: upload ftp.example.com user password ./source_dir ./remote_dir"
echo "Uploading $4 to $2:$3@$1:$5"
lftp -f "
set ftp:ssl-allow off
open $1
user $2 $3
lcd $4
mirror --reverse --delete --verbose $4 $5 --ignore-time --parallel=10 --exclude-glob .git* --exclude .git/"
