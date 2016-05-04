
# A base for python 3 projects
FROM ubuntu:15.10
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# Not essential, but wise to set the lang
# Note: Users with other languages should set this in their derivative image
RUN apt-get update && apt-get install -y language-pack-en
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# Python binary dependencies, developer tools
RUN apt-get update && apt-get install -y -q \
    build-essential make gcc zlib1g-dev \
    curl vim wget git \
    # Python 3
    python3-dev python3-pip python3-sphinx \
    libzmq3-dev sqlite3 libsqlite3-dev pandoc \
    libcurl4-openssl-dev python3-lxml libpq-dev \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN pip3 install --upgrade \
    setuptools pip ipython \
    wrapt tracestack wget httpie \
    plumbum paramiko invoke \
    prettytable \
    # http://blog.yhathq.com/posts/11-python-libraries-you-might-not-know.html
    tqdm dill joblib  \
    snowballstemmer colorama uuid

WORKDIR /tmp
RUN git clone https://github.com/esafak/commentjson.git \
    && cd commentjson && python3 setup.py install
