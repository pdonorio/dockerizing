FROM docker:latest

RUN apk --update --no-cache add python3 py3-pip docker-compose \
    bash curl openssl openssh-client groff

RUN pip3 install --no-cache-dir --quiet awscli

ARG KUBERNETES_VERSION=1.18.8
ENV KUBERNETES_VERSION ${KUBERNETES_VERSION}
ENV GSTORAGE_URL https://storage.googleapis.com/kubernetes-release

WORKDIR /usr/local/bin
RUN curl -LO $GSTORAGE_URL/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl && kubectl version --client && echo kube installed

RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
    && helm version && echo helm installed
# && helm plugin install https://github.com/hypnoglow/helm-s3.git \
# && helm plugin list \
