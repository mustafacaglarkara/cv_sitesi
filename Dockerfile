# Use the official lightweight Python image.
FROM python:3.13-slim

# Install system build dependencies and cleanup lists
RUN apt-get update && apt-get install -y \
    python3-dev \
    build-essential \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/* \
 && pip install --upgrade pip

ENV VIRTUAL_ENV=/opt/venv

# (Optional) install virtualenv if you need an isolated venv inside the image
RUN pip install --no-cache-dir virtualenv && python -m virtualenv $VIRTUAL_ENV || true

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy requirements and install Python deps
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copy app sources and set working directory
WORKDIR /srv/app
COPY . /srv/app

# Recommended runtime envs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


