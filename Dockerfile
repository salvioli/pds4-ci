FROM ubuntu:20.04
ARG LDD_TOOL_VERSION=10.1.2
ARG VALIDATE_TOOL_VERSION=1.24.0

WORKDIR /root

RUN apt-get update && \
    apt install -y \
	make \
	unzip \
	default-jre-headless

ENV JAVA_HOME=/usr

ADD https://github.com/NASA-PDS/pds4-information-model/releases/download/v${LDD_TOOL_VERSION}/lddtool-${LDD_TOOL_VERSION}-bin.zip lddtool.zip
RUN unzip lddtool.zip && echo "PATH=$PATH:$PWD/lddtool-${LDD_TOOL_VERSION}/bin/" >> ~/.bashrc && rm lddtool.zip

ADD https://github.com/NASA-PDS/validate/releases/download/${VALIDATE_TOOL_VERSION}/validate-${VALIDATE_TOOL_VERSION}-bin.zip validate.zip
RUN unzip validate.zip && echo "PATH=$PATH:$PWD/validate-${VALIDATE_TOOL_VERSION}/bin/" >> ~/.bashrc && rm validate.zip