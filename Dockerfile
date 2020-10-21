FROM alpine/git
WORKDIR /clone
RUN git clone https://github.com/openshift-academia-online/spring-petclinic --single-branch -b v2.0

FROM maven:alpine
WORKDIR /build
COPY --from=0 /clone/spring-petclinic .
RUN mvn install && mv target/spring-petclinic-*.jar target/spring-petclinic.jar

FROM openjdk:jre-alpine
WORKDIR /app
COPY --from=1  /build/target/spring-petclinic.jar .

ENTRYPOINT ["java", "-jar"]
CMD ["spring-petclinic.jar"]
