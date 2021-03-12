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
        	// 构建上传镜像到容器仓库
            def customImage = docker.build("my-app", "--build-arg PRO_ENV=test .")
            docker.withRegistry("https://ccr.ccs.tencentyun.com/blackhole/jenkins", 'jenkins') {
                /* Push the container to the custom Registry */
                customImage.push()
            }
        }
    }
}
