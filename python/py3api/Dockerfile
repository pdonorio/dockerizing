# Python3 flask server for REST API backend

# Stack with no hub:
# $ cd python/py3base; docker build -t pdonorio_py3kbase .
# $ cd ../py3api; docker build -t pdonorio_py3api .

FROM pdonorio/py3kbase
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

VOLUME /opt

# Install the micro framework and important plugins
RUN pip3 install flask \
    flask-restful flask-security flask-cors \
    simplejson

# Save the full stack of necessary libraries somewhere inside the container
RUN pip3 freeze > /opt/requirements.txt
