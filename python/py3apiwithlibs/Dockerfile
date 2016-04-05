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
