#!/usr/bin/env bash

docker login http://ccr.ccs.tencentyun.com/blackhole/jenkins -u 100018063721 -p gm152688

docker push maven:3-alpine
