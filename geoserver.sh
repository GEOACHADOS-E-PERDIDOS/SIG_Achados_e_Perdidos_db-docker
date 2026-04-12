#!/bin/bash

docker run -d \
  -p 5538:8080 \
  --name geoserver \
  docker.osgeo.org/geoserver:2.28.0
