FROM openjdk:8

COPY . usr/src/myapp 

WORKDIR /usr/src/myapp

# Converting the mvnw line endings during build (if you don’t change line endings of the mvnw file)
RUN apt-get update && apt-get install -y dos2unix
RUN dos2unix ./mvnw

RUN ./mvnw package

EXPOSE 8080

CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]

# docker build . -t spring-project && docker run -p 8080:8080 spring-project
