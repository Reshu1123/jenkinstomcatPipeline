pipeline {
    environment {
        registry = "reshmababu/tomcatimage"
        registryCredentials = 'docker_hub_id'        
    }
    agent any 
    stages {
        stage('Cloning git') {
            steps {
                git([url:'https://github.com/Reshu1123/jenkinstomcatPipeline.git',branch:'master',credentialsId:'github_id'])
            }
        }
        stage('Build Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }                
            }
        }
        stage('Deploy image') {
            steps {
                sh 'docker run -d reshmababu/tomcatimage:$BUILD_NUMBER
            }
        }
        stage('Push Image') {
            steps{
                script {
                    docker.withRegistry('', registryCredentials) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
