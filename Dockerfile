# 下载maven与java的镜像
FROM hub.c.163.com/wuxukun/maven-aliyun:3-jdk-8
# 指定当前操作目录
WORKDIR /usr/local/jenkins/my-app
#指定对外端口号
EXPOSE 8181
#启动java程序
#--spring.profiles.active=dev 多环境下指定环境 。 -c为清除以前启动的数据
#ENTRYPOINT ["java","-jar","my-app-1.0-SNAPSHOT.jar","--spring.profiles.active=dev","-c"]
ENTRYPOINT ["java","-jar","my-app-1.0-SNAPSHOT.jar","-c","-p 8181:8181"]
