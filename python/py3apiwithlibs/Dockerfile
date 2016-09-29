#########################################
# Python3 flask server and some other libs

FROM pdonorio/py3api
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@gmail.com>"

RUN apt-get update && apt-get install -y -q \
    # Zoomify extra python libs
    python2.7-minimal python-pil \
    # Images conversion
    imagemagick \
    && apt-get clean

RUN pip install --upgrade pip timestring

# # RETHINKDB python latest driver?
# git clone https://github.com/rethinkdb/rethinkdb.git
# cd rethinkdb/
# git checkout next
# ./configure --allow-fetch
# make --directory ./drivers/python
# cd drivers/python/
# python3 setup.py install

# rethinkdb-dump -c rdb -f /code/backup/latest.tar.gz
