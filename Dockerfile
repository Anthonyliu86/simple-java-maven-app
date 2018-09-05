FROM oraclelinux:7.5

ENV http_proxy=http://cn-proxy.jp.oracle.com:80 \
    https_proxy=http://cn-proxy.jp.oracle.com:80 \
    JAVA_HOME=/usr/java/jdk1.8.0_181 \
    JDK15HOME=/usr/java/jdk1.8.0_181 \
    MAVEN_HOME=/usr/maven/apache-maven-3.5.4

RUN mkdir -p /root/.vnc  /home/selenium  /usr/maven /usr/java /scratch /systemtests/testresults /home/key /jdk  /root/work/oracle/work /systemtests/lib  \
     && chmod -R 777 /systemtests
RUN yum install tar tcsh unzip wget perl git firefox "perl(MIME::Lite)" xorg-x11-server-common xorg-x11-xauth libXdmcp libXfont2 libXtst -y;yum -y clean all \
    && rm -rf /var/cache/yum

## Install java
#RUN wget http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
COPY jdk-8u181-linux-x64.tar.gz /jdk
RUN tar -zxvf /jdk/jdk-8u181-linux-x64.tar.gz -C /usr/java/ \
&& chmod 777 /usr/java/jdk1.8.0_181 \
&& rm -rf /jdk/jdk-8u181-linux-x64.tar.gz
RUN ln -s /usr/java/jdk1.8.0_181/bin/java /usr/bin/java
## Install maven
#RUN wget http://ftp.jaist.ac.jp/pub/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
COPY apache-maven-3.5.4-bin.tar.gz /scratch
RUN chmod 777 /scratch/apache-maven-3.5.4-bin.tar.gz
RUN tar -zxvf /scratch/apache-maven-3.5.4-bin.tar.gz -C /usr/maven/ \
&& chmod 777 /usr/maven/apache-maven-3.5.4 \
&& rm -rf /scratch/apache-maven-3.5.4-bin.tar.gz
#RUN cp -R apache-maven-3.5.4 /usr/local/bin;
RUN ln -s /usr/maven/apache-maven-3.5.4/bin/mvn /usr/bin/mvn

## Set env
RUN echo "export JAVA_HOME=/usr/java/jdk1.8.0_181" >> /etc/profile \
&& echo "export MAVEN_HOME=/usr/maven/apache-maven-3.5.4" >> /etc/profile \
&& echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile \
&& echo "export PATH=$MAVEN_HOME/bin:$PATH" >> /etc/profile \
&& echo "export JDK15HOME=/usr/java/jdk1.8.0_181" >> /etc/bashrc \
&& echo "export PATH=$MAVEN_HOME/bin:$JAVA_HOME/bin:$PATH" >> /etc/bashrc
RUN source /etc/profile
CMD date



