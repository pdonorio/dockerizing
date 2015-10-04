#########################################
# The python3 base for flask boilerplate

FROM pdonorio/py3api
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# Postgres dev
RUN apt-get update && apt-get install -y libpq-dev
# Connection via sqlalchemy
RUN pip install --upgrade sqlalchemy psycopg2 \
    Flask-SQLAlchemy Flask-WTF

VOLUME /data
WORKDIR /data
