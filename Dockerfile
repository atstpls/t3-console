FROM python:3.6-alpine

RUN adduser -D t3

WORKDIR /home/t3

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY t3.py config.py boot.sh app.db ./
RUN chmod a+x boot.sh

ENV FLASK_APP t3.py
ENV FLASK_ENV=development
ENV FLASK_DEBUG=1

RUN chown -R t3:t3 ./
USER t3

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]