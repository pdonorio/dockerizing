FROM alpine:3.11.3
RUN apk update \
    && apk add  --no-cache py3-scipy curl bash \
    && pip3 --no-cache-dir install --upgrade pip

# NOTE: may need a dedicated image for slow wheels:
# spacy (nltk?), pandas, cryptography (gensim? blis?)

WORKDIR /tmp
COPY requirements.txt .
RUN apk add --no-cache --virtual .build-deps \
        python3-dev py3-numpy-dev \
        gcc g++ build-base libffi-dev \
        curl-dev postgresql-dev \
        gmp-dev mpfr-dev mpc1-dev \
        jpeg-dev zlib-dev musl-dev \
    && pip3 --no-cache-dir install -r requirements.txt \
    && apk del .build-deps

# NOTE: probably needed also
# tesseract-ocr tesseract-ocr-dev

# NOTE: test
# ERROR: django-grip 3.0.0 has requirement Werkzeug<1,>=0.12,
# but you'll have werkzeug 1.0.0 which is incompatible.

ENV $PROJECT_DIR /project
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
