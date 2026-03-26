#!/bin/bash

docker run -d \
  --name minio \
  -p 9000:9000 \
  -p 9001:9001 \
  -e MINIO_ROOT_USER=AdminUser1 \
  -e MINIO_ROOT_PASSWORD=S3nh@F0rte! \
  -v minio-data:/data \
  minio/minio server /data --console-address ":9001"
