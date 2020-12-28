ARG DOCKER_VERSION=20.10.1
# FROM docker:latest
FROM docker:$DOCKER_VERSION

RUN apk --update --no-cache add \
    python3 py3-pip docker-compose \
    bash curl jq openssl openssh-client groff

RUN pip3 install --no-cache-dir --quiet awscli

ARG KUBERNETES_VERSION=1.18.8
ENV KUBERNETES_VERSION ${KUBERNETES_VERSION}
ENV GSTORAGE_URL https://storage.googleapis.com/kubernetes-release

WORKDIR /usr/local/bin
RUN curl -LO $GSTORAGE_URL/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl && kubectl version --client && echo kube installed

ENV HELM_URL https://raw.githubusercontent.com/helm/helm
RUN curl -fsSL $HELM_URL/master/scripts/get-helm-3 | bash \
    && helm version && echo helm installed
# && helm plugin install https://github.com/hypnoglow/helm-s3.git \
# && helm plugin list \

ENV BUILDX_VERSION=0.4.2
RUN wget https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-amd64 -O buildx
