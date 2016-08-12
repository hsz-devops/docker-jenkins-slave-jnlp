FROM jenkinsci/jnlp-slave

# docker run jenkinsci/jnlp-slave -url http://jenkins-server:port <secret> <slave name>

USER root
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        less \
        bash \
        sudo \
        \
        mc \
        htop \
        \
        python3 \
        python3-pip \
    && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - &&\
    apt-get install -y nodejs &&\
    \
    rm -rf /var/lib/apt/lists/*

USER jenkins

ENTRYPOINT ["jenkins-slave"]
