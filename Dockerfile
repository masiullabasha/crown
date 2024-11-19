
FROM tomcat:8.0.20-jre8

MAINTAINER Masiulla

COPY target/crownproj.war /usr/local/tomcat/webapps/crownprince.war

RUN /bin/bash -c "sed -i -E '/<\/tomcat-users>/ i \
  <role rolename=\"manager-gui\" />\n\
  <role rolename=\"admin-gui\" />\n\
  <user username=\"tomcat\" password=\"tomcat1\" roles=\"manager-gui\" />\n\
  <user username=\"admin\" password=\"admin1\" roles=\"manager-gui,admin-gui\" />' \
  /usr/local/tomcat/conf/tomcat-users.xml"

RUN /bin/bash -c "sed -i -E '/allow/ s/(0:1)/&|.*/' /usr/local/tomcat/webapps/manager/META-INF/context.xml"

WORKDIR /usr/local/tomcat/webapps

#ENTRYPOINT ["java","-jar","crownprince.war"]



