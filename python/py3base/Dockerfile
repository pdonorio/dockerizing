
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
    curl nano vim wget git \
    # Compiler libs
    build-essential make gcc \
    libssl-dev libffi-dev zlib1g-dev \
    # requested for openssl in python
    libffi-dev \
    # Python 3
    python3.6-dev python3.6-pip \
    # extras for python
    python3-sphinx \
    libzmq3-dev sqlite3 libsqlite3-dev pandoc \
    libcurl4-openssl-dev python3-lxml libpq-dev \
    # CLEAN
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

# Python essential libs
RUN pip3 install --upgrade \
    # the very base
    setuptools pip ipython \
    # utilities
    attrs wrapt tracestack wget httpie \
    # cli utilities
    plumbum paramiko invoke \
    # pretty print
    prettytable beeprint \
    # Very usefull to read JSON files with comments
    git+https://github.com/esafak/commentjson@master \

# MORE TO BE CONSIDERED...
# # http://blog.yhathq.com/posts/11-python-libraries-you-might-not-know.html
# tqdm dill joblib  \
# snowballstemmer colorama uuid
