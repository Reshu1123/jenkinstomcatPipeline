FROM centos
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN yum -y install curl
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.61/bin/apache-tomcat-8.5.61.tar.gz
RUN tar xvfz apache-tomcat-8.5.61.tar.gz
RUN yum -y install java
RUN java -version
WORKDIR /opt/tomcat/apache-tomcat-8.5.61
EXPOSE 8080
CMD ["/opt/tomcat/apache-tomcat-8.5.61/bin/catalina.sh", "run"]
