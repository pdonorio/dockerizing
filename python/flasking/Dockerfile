#########################################
# The python3 base for flask boilerplate

FROM pdonorio/py3api
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

ENV TERM xterm

# Postgres dev
RUN apt-get update && apt-get install -y libpq-dev
# Connection via sqlalchemy
RUN pip install --upgrade \
    sqlalchemy psycopg2 \
    Werkzeug Flask-SQLAlchemy \
    flask_table Flask-WTF WTForms-Alchemy \
    Flask-Login \
    gunicorn meinheld

VOLUME /data
WORKDIR /data
