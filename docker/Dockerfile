FROM maven:3.5-jdk-8

ARG PANDOC_VERSION="2.2.3.2"

# Install dependencies texlive, graphviz
RUN apt-get update \
    && apt-get install -y texlive-latex-base graphviz \
    && apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && apt-get clean

# pandoc 2.x required
RUN curl -fL https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz | tar xzv --strip-components 1 -C /usr/local/

RUN apt-get install -y texlive-fonts-recommended librsvg2-bin

# Set workdir (also mountpoint for docker volume)
WORKDIR /home/jenkins
