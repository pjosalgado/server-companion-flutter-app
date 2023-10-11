FROM debian:12.1-slim AS build-env

RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 \
    gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3 sed
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"

RUN flutter doctor -v
RUN flutter channel stable
RUN flutter upgrade

RUN mkdir /app
WORKDIR /app

COPY pubspec.yaml /app
COPY lib /app/lib
COPY web /app/web

RUN flutter build web


FROM nginx:1.25-alpine

LABEL maintainer="Paulo Salgado <pjosalgado@gmail.com>"
LABEL version="1.0.0-1"

COPY --from=build-env /app/build/web /usr/share/nginx/html
