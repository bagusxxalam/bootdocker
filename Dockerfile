FROM openjdk:8

# Gradle
ENV GRADLE_VERSION 4.0
ENV GRADLE_SHA c58650c278d8cf0696cab65108ae3c8d95eea9c1938e0eb8b997095d5ca9a292

RUN cd /usr/lib \
 && curl -fl https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-bin.zip \
 && echo "$GRADLE_SHA gradle-bin.zip" | sha256sum -c - \
 && unzip "gradle-bin.zip" \
 && ln -s "/usr/lib/gradle-${GRADLE_VERSION}/bin/gradle" /usr/bin/gradle \
 && rm "gradle-bin.zip"

# Set Appropriate Environmental Variables
ENV GRADLE_HOME /usr/lib/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

# Default command is "/usr/bin/gradle -version" on /usr/bin/app dir
# (ie. Mount project at /usr/bin/app "docker --rm -v /path/to/app:/usr/bin/app gradle <command>")
WORKDIR /usr/bin/app
ENTRYPOINT ["gradle"]
CMD ["-gradle build"]


ADD /build/libs/docker-1.0.1.jar BootDocker.jar
ENTRYPOINT ["java","-jar","BootDocker.jar"]
EXPOSE 8080