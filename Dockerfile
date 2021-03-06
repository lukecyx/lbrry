FROM python:3.10-bullseye


# Python.
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV TERM=xterm-256color


RUN apt-get update && apt-get -y dist-upgrade && apt install -y grc


RUN mkdir /app


WORKDIR /app/


# Setup and install poetry.
ENV POETRY_VERSION=1.1.12
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_CACHE_DIR="/var/cache/pypoetry"


# Install poetry
RUN pip install "poetry==$POETRY_VERSION"
COPY pyproject.toml poetry.lock /app/
RUN poetry install


COPY . .
