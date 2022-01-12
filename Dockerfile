FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN pip install pipenv

COPY Pipfile /.
COPY Pipfile.lock /.

RUN pipenv install --system --deploy --ignore-pipfile
RUN rm Pipfile Pipfile.lock

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN adduser -D user
USER user 