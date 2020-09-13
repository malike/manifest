FROM openjdk:8
VOLUME /tmp
ADD target/service-admin-0.0.1-SNAPSHOT.jar service-admin.jar
RUN sh -c 'touch /service-admin.jar'
ENV JAVA_OPTS="-Xms64m -Xmx64m"
EXPOSE 9191
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=docker -jar /service-admin.jar" ]