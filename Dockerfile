FROM openjdk:8

CMD ["-gradlew"]
CMD ["-gradle build"]


ADD /build/libs/docker-1.0.1.jar BootDocker.jar
ENTRYPOINT ["java","-jar","BootDocker.jar"]
EXPOSE 8080