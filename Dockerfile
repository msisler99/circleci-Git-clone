FROM alpine:3.8

# Based on curl-ssl and awscli from GDS UK's repo:
# https://github.com/alphagov/paas-docker-cloudfoundry-tools/blob/master/awscli/Dockerfile

# Install packages needed for AWS and Terraform
ENV PACKAGES "curl openssl ca-certificates groff less python3 jq terraform"
RUN apk add --update ${PACKAGES} \
    && pip3 install --upgrade pip \
    && pip3 install awscli \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

# Move the files into the container and make it the default dir
ENV FILES_DIR "/src"
RUN mkdir ${FILES_DIR}
ADD . ${FILES_DIR}
WORKDIR ${FILES_DIR}
