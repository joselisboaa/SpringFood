FROM eclipse-temurin:17-jdk-alpine

VOLUME /tmp

COPY . .

RUN ./mvnw clean && ./mvnw package -DskipTests

ARG JAR_FILE=target/spring-food-0.0.1-SNAPSHOT.jar

ADD ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "/app.jar" ]