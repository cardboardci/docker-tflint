FROM alpine:latest

RUN apk add -U curl zip
ARG TFLINT_VERSION=v0.5.1

RUN curl -Lo tflint.zip https://github.com/wata727/tflint/releases/download/${TFLINT_VERSION}/tflint_linux_amd64.zip
RUN unzip tflint.zip -d /bin 
RUN rm -f tflint.zip

CMD [ "tflint" ]