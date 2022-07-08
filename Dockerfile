FROM python:3.8-alpine

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""

RUN mkdir -p /etc/rotate-backups.d/ /backups && \
      apk add --no-cache \
               git && \
      pip install git+https://github.com/aroberts/python-rotate-backups.git


COPY docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "2"]
