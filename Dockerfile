FROM alpine:3.7
RUN apk add --no-cache lftp
RUN mkdir ~/.lftp
RUN echo "set ssl:verify-certificate no" >> ~/.lftp/rc
RUN echo 'lftp -f "\n\
set ftp:ssl-allow off\n\
open $HOST\n\
user $USER $PASS\n\
lcd $SOURCEFOLDER\n\
mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER\n\
bye"'\
>> /upload.sh
RUN cat /upload.sh
RUN chmod +x /upload.sh
ENTRYPOINT ["/upload.sh"]
