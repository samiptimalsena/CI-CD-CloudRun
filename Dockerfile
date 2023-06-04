FROM python:3.8-slim

RUN mkdir /app 
RUN python -m venv /app/venv

ENV PATH="/app/venv/bin:$PATH"

COPY requirements.txt /app

RUN apt-get update \
    && pip install pip==20.0.1 \
    && pip install --no-cache-dir -r /app/requirements.txt

COPY app.py /app

CMD gunicorn --bind 0.0.0.0:$PORT --threads=2 --workers=2 app.app:app