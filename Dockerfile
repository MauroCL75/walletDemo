FROM oraclelinux:8

ARG release=19
ARG update=9

RUN  dnf -y install oracle-release-el8 && \
     dnf -y install oracle-instantclient${release}.${update}-basic oracle-instantclient${release}.${update}-devel oracle-instantclient${release}.${update}-sqlplus 

RUN  dnf -y install python3 python3-pip python3-virtualenv make java-1.8.0-openjdk-headless java-1.8.0-openjdk-devel && \
     rm -rf /var/cache/dnf


RUN groupadd -g 1000 oracle
RUN adduser -u 1000 -g oracle -s /bin/sh -m oracle
COPY . /home/oracle
RUN chown -R oracle:oracle /home/oracle
WORKDIR /home/oracle
USER oracle

RUN cd /home/oracle && make all
