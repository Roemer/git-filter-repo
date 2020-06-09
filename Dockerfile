FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y nano git python3-pip python3-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip \
    && pip3 install git-filter-repo \
    && rm -rf /var/lib/apt/lists/*

CMD ["python3"]
