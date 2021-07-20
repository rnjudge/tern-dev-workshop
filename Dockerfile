FROM quay.io/eduk8s/base-environment:master

RUN rpm -i python3 python3-pip python3-venv attr git jq openjdk-8-jdk-headless maven

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

RUN fix-permissions /home/eduk8s
