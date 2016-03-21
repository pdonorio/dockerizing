#########################################
# Python3 flask server for REST API backend

FROM pdonorio/py3kbase
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# Install the micro framework and important plugins
RUN pip install --upgrade pip \
	Flask \
	flask-restful flask-sqlalchemy flask-cors flask-admin \
	# Security develop, to handle latest flask-login... \
	git+git://github.com/mattupstate/flask-security \
	# Multithread apis (like uber) \
	gunicorn \
	########################## \
	# INTERESTING APIs \
	########################## \
	rethinkdb \
	py2neo neomodel \
	git+git://github.com/irods/python-irodsclient.git \
    elasticsearch \
	########################## \
	# The real Token \
	pyjwt

RUN mkdir -p /code
WORKDIR /code
