#########################################
# Python3 flask server for REST API backend

FROM pdonorio/py3kbase
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# Install the micro framework and important plugins
RUN pip install --upgrade pip \
    # Tests
    nose nose2 cov-core \
	# Tests coverage (http://nose.readthedocs.org/en/latest/plugins/cover.html)
	coverage \
	# Flask server for HTTP API
	Flask \
	# Flask main plugins
	flask-restful flask-sqlalchemy flask-cors flask-admin \
    # Oauth
    pyopenssl flask-oauthlib \
	# Security develop, to handle latest flask-login...
	git+git://github.com/mattupstate/flask-security \
	# Multithread apis (like uber)
	gunicorn \
	##########################
	# SERVICEs APIs
	##########################
	rethinkdb \
    elasticsearch \
    # Not ready for neo4j 3 at the moment
	py2neo==2.0.8 neomodel \
	git+git://github.com/irods/python-irodsclient.git \
	##########################
	# The real Token
	pyjwt

RUN mkdir -p /code
WORKDIR /code
