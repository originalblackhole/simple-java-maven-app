#!/usr/bin/env bash

sudo docker login --username=100018063721 ccr.ccs.tencentyun.com -p gm152688
sudo docker tag 5435658a63ac ccr.ccs.tencentyun.com/blackhole/jenkins:3-1-alpine
sudo docker push ccr.ccs.tencentyun.com/blackhole/jenkins:3-1-alpine

