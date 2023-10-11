#!/bin/bash
docker buildx build --platform=linux/arm64 --push -t paulosalgado/server-companion-web:1.0.0-1 .
