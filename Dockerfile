FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt update -y \
    && apt install -y --no-install-recommends \
    git \
    wget \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    libgdbm-dev \
    libdb-dev \
    uuid-dev \
    tar \
    python3 \
    python3-pip

RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /home

COPY requirements.txt /tmp/requirements.txt
RUN yes | pip3 install -r /tmp/requirements.txt

EXPOSE 8000
COPY . /home

