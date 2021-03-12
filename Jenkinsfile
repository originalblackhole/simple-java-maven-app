pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
        stage('Build Docker'){
            steps {
                //sh './jenkins/scripts/deploy.sh'
                sh 'docker login http://ccr.ccs.tencentyun.com/blackhole/jenkins -u 100018063721 -p gm152688'
                sh 'docker push maven:3-alpine'
            }
        }
    }
}
