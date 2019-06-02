FROM alpine:3.8

RUN apk add --no-cache curl=7.61.1-r1 zip=3.0-r6 && rm -rf /var/cache/apk/*
ARG TFLINT_VERSION=v0.8.2

RUN curl -Lo tflint.zip https://github.com/wata727/tflint/releases/download/${TFLINT_VERSION}/tflint_linux_amd64.zip
RUN unzip tflint.zip -d /bin 
RUN rm -f tflint.zip

CMD [ "tflint" ]