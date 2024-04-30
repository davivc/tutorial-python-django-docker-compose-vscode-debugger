FROM python:3.11.4-slim as base

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .
EXPOSE 8000

## --- Debug ---
FROM base as debug
RUN pip install debugpy==1.8.1
EXPOSE 5678