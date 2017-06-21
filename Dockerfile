#Offline build
#FROM openjdk:8
#ADD /build/libs/docker-1.0.1.jar docker-app.jar
#ENTRYPOINT ["java","-jar","docker-app.jar"]

#Production build
FROM gradle:jdk8-alpine
ADD gradle gradle
ADD src src
ADD build.gradle build.gradle
ADD gradlew gradlew
RUN sh -c 'gradle build'
ENTRYPOINT ["sh","-c","java -jar ./build/libs/docker-1.0.1.jar"]

EXPOSE 8080