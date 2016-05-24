
# A base for python 3 projects
FROM ubuntu:16.04
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# Not essential, but wise to set the lang
RUN apt-get update && apt-get install -y language-pack-en
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# Python binary dependencies, developer tools
RUN apt-get update && apt-get install -y -q \
    curl vim wget git \
    # Compiler libs
    build-essential make gcc \
    libssl-dev libffi-dev zlib1g-dev \
    # Python 3
    python3-dev python3-pip python3-sphinx \
    libzmq3-dev sqlite3 libsqlite3-dev pandoc \
    libcurl4-openssl-dev python3-lxml libpq-dev \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

# Python essential libs
RUN pip3 install --upgrade \
    setuptools pip ipython \
    wrapt tracestack wget httpie \
    plumbum paramiko invoke \
    prettytable

# # http://blog.yhathq.com/posts/11-python-libraries-you-might-not-know.html
# tqdm dill joblib  \
# snowballstemmer colorama uuid

# Very usefull to read JSON files with comments
WORKDIR /tmp
RUN git clone https://github.com/esafak/commentjson.git \
    && cd commentjson && python3 setup.py install
