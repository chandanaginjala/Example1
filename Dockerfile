FROM  amazoncorretto:17.0.7-alpine
EXPOSE 8089
ADD target/demo-0.0.1-SNAPSHOT.war demo-0.0.1-SNAPSHOT.war
ENTRYPOINT [ "java","-jar","/demo-0.0.1-SNAPSHOT.war" ]