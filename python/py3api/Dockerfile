# Python3 flask server for REST API backend

# Stack with no hub:
# $ cd python/py3base; docker build -t pdonorio_py3kbase .
# $ cd ../py3api; docker build -t pdonorio_py3api .

FROM pdonorio/py3kbase
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# Dependencies?

# Install the micro framework and important plugins
ADD requirements.txt /opt/apirequ.txt
RUN pip install -r /opt/apirequ.txt

RUN mkdir -p /code
WORKDIR /code
