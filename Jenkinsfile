pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build ----------- >') {
            steps {
                script{
                    pom = readMavenPom file: 'location/pom.xml'
                    docker_img_name = "myapp/test"
                    build_tag = "latest"
                }
                //echo "Hello ${build_tag}"
                sh 'mvn -B -DskipTests clean package'
                sh "docker build -t myapp/test:latest --build-arg SPRING_PROFILE=prod --build-arg JAR_FILE=target/my-app-1.0-SNAPSHOT.jar ./location/"
            }
        }
        
        stage('Deliver ----------- >') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
        stage('deploy ----------- >'){
            steps {
                sh 'sudo ./jenkins/scripts/deploy.sh'
                //sh 'docker login http://ccr.ccs.tencentyun.com/blackhole/jenkins -u 100018063721 -p gm152688'
                //sh 'docker push maven:3-alpine'
            }
        }
    }
}
