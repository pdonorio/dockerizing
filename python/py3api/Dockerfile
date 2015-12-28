# Python3 flask server for REST API backend
FROM pdonorio/py3kbase
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# Install the micro framework and important plugins
ADD requirements.txt /opt/apirequ.txt
RUN pip install -r /opt/apirequ.txt
RUN pip install --upgrade Flask \
	pyjwt flask-restplus flask-sqlalchemy \
	flask-cors flask-admin \
	git+git://github.com/mattupstate/flask-security
	# Security develop, to handle latest flask-login...

RUN mkdir -p /code
WORKDIR /code
