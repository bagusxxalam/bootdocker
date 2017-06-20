FROM gradle:jdk8-alpine

CMD ["docker run --rm -v "$PWD":/docker -w /docker --name gradle gradle:alpine gradle build"]

ADD /build/libs/docker-1.0.1.jar BootDocker.jar
ENTRYPOINT ["java","-jar","BootDocker.jar"]
EXPOSE 8080