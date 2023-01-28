FROM openjdk:18-alpine as builder
#WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src
RUN ./mvnw package
#ARG JAR_FILE=/app/target/*.jar
#COPY ${JAR_FILE} app.jar


FROM openjdk:18-alpine
#WORKDIR /app
EXPOSE 8080
COPY --from=builder /target/*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
