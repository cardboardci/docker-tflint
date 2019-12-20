FROM cardboardci/ci-core:focal
USER root

ARG DEBIAN_FRONTEND=noninteractive

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG VERSION=v0.12.1
RUN curl -SL "https://github.com/wata727/tflint/releases/download/${VERSION}/tflint_linux_amd64.zip" -o /tmp/tflint.zip \
    && unzip /tmp/tflint.zip -d /usr/bin/ \
    && rm -f tflint.zip

USER cardboardci

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer="CardboardCI"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="tflint"
LABEL org.label-schema.version="${version}"
LABEL org.label-schema.build-date="${build_date}"
LABEL org.label-schema.release="CardboardCI version:${version} build-date:${build_date}"
LABEL org.label-schema.vendor="cardboardci"
LABEL org.label-schema.architecture="amd64"
LABEL org.label-schema.summary="Terraform linter"
LABEL org.label-schema.description="TFLint is a Terraform linter for detecting errors that can not be detected by terraform plan"
LABEL org.label-schema.url="https://gitlab.com/cardboardci/images/tflint"
LABEL org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/tflint/releases"
LABEL org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/tflint"
LABEL org.label-schema.distribution-scope="public"
LABEL org.label-schema.vcs-type="git"
LABEL org.label-schema.vcs-url="https://gitlab.com/cardboardci/images/tflint"
LABEL org.label-schema.vcs-ref="${vcs_ref}"