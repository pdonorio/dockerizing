# Python3 ipython and notebook server

# Stack
# $ cd python/py3base; docker build -t pdonorio_py3kbase .
# $ cd ../py3notebook; docker build -t pdonorio_py3knb .

FROM pdonorio_py3kbase
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# More dependencies - notebooks are very heavy in those
RUN apt-get install -y nodejs nodejs-legacy npm

# Define an ipthon kernel
VOLUME /srv
WORKDIR /srv
RUN git clone --depth 1 https://github.com/ipython/ipykernel \
    && cd ipykernel && pip3 install --pre -e . && cd .. && rm -rf ipykernel

# Define environment for notebooks
RUN git clone https://github.com/jupyter/notebook.git \
    && chmod -R +rX notebook && cd notebook \
    && pip3 install -e .[test] && cd .. && rm -rf notebook

# Install latest notebook package
RUN pip3 install notebook

# Start referring to a data directory
VOLUME /data
WORKDIR /data
