FROM ubuntu
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean && \
    apt-get install curl -y && \
    mkdir /usr/tmp
    
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export=JAVA_HOME
ARG agent_port=50000
EXPOSE ${agent_port}

RUN curl http://ftp-nyc.osuosl.org/pub/jenkins/war-stable/2.190.1/jenkins.war > /usr/tmp/jenkins.war
RUN touch test.txt

CMD  java -jar /usr/tmp/jenkins.war

# RUN cat /root/.jenkins/secrets/initialAdminPassword










