FROM openjdk:11
COPY . /mudi
WORKDIR /mudi
CMD ["java", "-jar", "target/mudi-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080