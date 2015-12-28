#########################################
# The python3 base for flask boilerplate (front-end)

FROM pdonorio/py3api
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

# Postgres dev
#RUN apt-get update && apt-get install -y libpq-dev
# Connection via sqlalchemy
RUN pip install --upgrade \
    sqlalchemy psycopg2 Werkzeug Flask-SQLAlchemy \
    flask_table Flask-WTF WTForms-Alchemy \
    gunicorn meinheld tornado

# the last three are a possible way 
# to launch a multithread serious python server

VOLUME /data
WORKDIR /data
