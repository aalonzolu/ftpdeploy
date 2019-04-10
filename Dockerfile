FROM alpine:3.7
RUN apk add --no-cache lftp
RUN echo 'lftp -f "\n\
set ftp:ssl-allow off\n\
open $HOST\n\
user $USER $PASS\n\
lcd $SOURCEFOLDER\n\
mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER\n\
bye"'\
>> /upload.sh
chmod +x /upload.sh
ENTRYPOINT ["mysql"]