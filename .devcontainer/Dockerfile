FROM mcr.microsoft.com/devcontainers/base:ubuntu

# must be amd64 or arm64
ARG TARGETARCH

# Install pip for Python3
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends python3-pip

# TERRAFORM
RUN cd /tmp && \
    version=1.4.4 && \
    curl -L --output terraform.zip https://hashicorp-releases.yandexcloud.net/terraform/${version}/terraform_${version}_linux_${TARGETARCH}.zip && \
    unzip terraform.zip -d /usr/local/bin && \
    rm -f terraform.zip

# TFLINT
RUN export TFLINT_VERSION=v0.45.0 && \
    curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# TFSEC
RUN cd /tmp && \
    version=1.28.1 && \
    curl -L --output tfsec https://github.com/aquasecurity/tfsec/releases/download/v${version}/tfsec-linux-${TARGETARCH} && \
    chmod +x tfsec && \
    mv tfsec /usr/local/bin

# CONFTEST
RUN cd /tmp && \
    version=0.40.0 && \
    if test ${TARGETARCH} = "amd64"; then arch="x86_64"; else arch=${TARGETARCH}; fi && \
    curl -L --output conftest.tar.gz https://github.com/open-policy-agent/conftest/releases/download/v${version}/conftest_${version}_Linux_${arch}.tar.gz && \
    tar xzf conftest.tar.gz && \
    mv conftest /usr/local/bin/

# TERRAFORM-DOCS
RUN cd /tmp && \
    version=0.16.0 && \
    curl -L https://github.com/terraform-docs/terraform-docs/releases/download/v${version}/terraform-docs-v${version}-linux-${TARGETARCH}.tar.gz | tar -xz && \
    mv terraform-docs /usr/local/bin

# PRE-COMMIT - https://github.com/pre-commit/pre-commit
RUN pip install \
    pre-commit==3.2.1

# YC CLI
RUN curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | \
    bash -s -- -i /opt/yc -n

ENV PATH="$PATH:/opt/yc/bin"

COPY .terraformrc /root/.terraformrc
