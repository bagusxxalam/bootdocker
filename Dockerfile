FROM gradle:jdk8-alpine
#ENTRYPOINT ["java","-jar","BootDocker.jar"]
#CMD ls
ADD gradle gradle
ADD src src
ADD build.gradle build.gradle
ADD gradlew gradlew
ADD gradlew.bat gradlew.bat
RUN sh -c './gradlew build'
ENTRYPOINT ["sh","-c","java -jar ./build/libs/docker-1.0.1.jar"]
#ADD /build/libs/docker-1.0.1.jar BootDocker.jar
EXPOSE 8080