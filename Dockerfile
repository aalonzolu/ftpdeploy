FROM alpine:3.7
RUN apk add --no-cache lftp
RUN mkdir ~/.lftp
RUN echo "set ssl:verify-certificate no" >> ~/.lftp/rc
COPY entrypoint.sh /upload.sh
COPY entrypoint.sh /usr/local/bin/upload
RUN chmod +x /upload.sh
RUN chmod +x /usr/local/bin/upload

