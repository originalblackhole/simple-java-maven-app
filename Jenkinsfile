pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                //checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/originalblackhole/simple-java-maven-app.git']]])
                git 'https://github.com/originalblackhole/simple-java-maven-app.git'
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('docker build'){
            /* agent {
            // Equivalent to "docker build -f Dockerfile.build --build-arg version=1.0.2 ./build/
                dockerfile {
                    filename 'Dockerfile'
                    additionalBuildArgs '--build-arg version=1.0.2'
                }
            } */
            steps {
                sh "docker build -t myapp/test:latest ."
            }
        }

        stage('deploy'){
            steps {
                sh ' ./jenkins/scripts/deploy.sh'
                //sh 'docker login http://ccr.ccs.tencentyun.com/blackhole/jenkins -u 100018063721 -p gm152688'
                //sh 'docker push maven:3-alpine'
                //sh "docker tag ${docker_img_name}:${build_tag} ${docker_img_name}:latest"
                //sh "docker tag ${docker_img_name}:${build_tag} ${docker_img_name}:${pom.version}"
                //withCredentials([usernamePassword(credentialsId: 'docker-register', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
                    //sh "docker login -u ${dockerUser} -p ${dockerPassword} docker.ryan-miao.com"
                    //sh "docker push ${docker_img_name}:latest"
                    //sh "docker push ${docker_img_name}:${pom.version}"
                    //sh "docker push ${docker_img_name}:${build_tag}"
                //}

            }
        }
    }
}

