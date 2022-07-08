FROM python:3.8-alpine

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""

RUN pip install git+https://github.com:aroberts/python-rotate-backups.git

RUN mkdir -p /etc/rotate-backups.d/ /backups

COPY docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]
