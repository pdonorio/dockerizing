#########################################
# The python3 base for flask boilerplate (front-end)

FROM pdonorio/py3api
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# Postgres dev
#RUN apt-get update && apt-get install -y libpq-dev
# Gevent dev
RUN apt-get install libffi-dev
# Connection via sqlalchemy
RUN pip install --upgrade \
    sqlalchemy psycopg2 Werkzeug Flask-SQLAlchemy \
    flask_table Flask-WTF WTForms-Alchemy \
# MULTITHREAD SERVERS \
    meinheld tornado \
# GEVENT \
    setuptools cffi tox 'cython>=0.23.4' \
    git+git://github.com/gevent/gevent.git#egg=gevent

VOLUME /data
WORKDIR /data
