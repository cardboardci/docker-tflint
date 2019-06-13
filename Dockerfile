FROM alpine:3.8

RUN apk add --no-cache curl=7.61.1-r2 zip=3.0-r6 && rm -rf /var/cache/apk/*
ARG TFLINT_VERSION=v0.8.2

RUN curl -Lo tflint.zip https://github.com/wata727/tflint/releases/download/${TFLINT_VERSION}/tflint_linux_amd64.zip
RUN unzip tflint.zip -d /bin 
RUN rm -f tflint.zip

CMD [ "tflint" ]

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "tflint" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "Terraform linter" \
    org.label-schema.description = "TFLint is a Terraform linter for detecting errors that can not be detected by terraform plan" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/tflint" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/tflint/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/tflint" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/tflint" \
    org.label-schema.vcs-ref = "${vcs_ref}" \