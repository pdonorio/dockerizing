FROM node:13.7.0-alpine
RUN apk add --update --no-cache \
    bash curl
RUN touch ~/.bashrc \
    && curl --compressed -o- -L https://yarnpkg.com/install.sh | bash \
    && yarn global add @vue/cli --prefix /usr/local
