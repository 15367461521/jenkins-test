#FROM java:8
FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY target/${JAR_FILE} app.jar
EXPOSE 8089
ENTRYPOINT ["java","-jar","/app.jar"]