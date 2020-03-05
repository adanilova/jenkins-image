FROM jenkins/jenkins

USER root
# Install docker-cli
RUN wget -qO- https://get.docker.com/ | sh


USER jenkins
# Replace default jenkins config
COPY config.xml ${JENKINS_HOME}/config.xml

# Install plugins
RUN /usr/local/bin/install-plugins.sh workflow-aggregator \
    && /usr/local/bin/install-plugins.sh git