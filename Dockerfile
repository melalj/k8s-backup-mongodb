FROM mongo:latest

RUN apt update
RUN apt install awscli -y

WORKDIR /scripts

COPY backup-mongodb.sh .
COPY restore-mongodb.sh .
RUN chmod +x backup-mongodb.sh
RUN chmod +x restore-mongodb.sh

ENV RESTORE_ARCHIVE_NAME ""
ENV RESTORE_EXTRA_PARAMS ""
ENV BACKUP_EXTRA_PARAMS ""
ENV AUTH_DB_NAME ""
ENV DB_NAME ""
ENV MONGODB_URI ""
ENV BUCKET_URI ""
ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""
ENV AWS_DEFAULT_REGION ""

CMD ["/scripts/backup-mongodb.sh"]
