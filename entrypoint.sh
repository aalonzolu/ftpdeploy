#!/bin/bash
lftp -f "
set ftp:ssl-allow off
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
bye"
