FROM openjdk:8
ADD /build/libs/docker-1.0.1.jar BootDocker.jar
ENTRYPOINT ["java","-jar","BootDocker.jar"]
EXPOSE 8080