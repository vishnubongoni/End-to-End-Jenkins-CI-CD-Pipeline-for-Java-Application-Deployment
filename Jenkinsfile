pipeline {
    agent any

    tools {
        maven "maven3"
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Code checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/vishnubongoni/End-to-End-Jenkins-CI-CD-Pipeline-for-Java-Application-Deployment.git'
            }
        }

        stage('Maven War file Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build and Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker',toolName: 'docker') {
            
                sh '''docker build -t demomavenapp .
                docker tag demomavenapp viishnu24/demomavenapp:latest
                docker push viishnu24/demomavenapp:latest'''
                }
            }
        }
    }
        stage('Run docker container') {
            steps {
                sh 'docker run -d -p 9000:8080 --name javamavenapp_container   viishnu24/demomavenapp:latest'
                
            }
        }

    }
}
