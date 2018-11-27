FROM ubuntu:bionic

# Env variables
ENV SBT_VERSION 1.2.6

RUN apt-get update && apt-get install -y \
  curl \
  git \
  ffmpeg \
  openjdk-11-jdk

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

