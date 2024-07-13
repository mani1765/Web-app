pipeline{
    agent any
    tools{
        maven 'maven3'
    }
    stages{
        stage('clone repo'){
            steps{

                git 'https://github.com/mani1765/web-app.git'

            }
        }
        stage('Build Using Maven'){
            steps{

                sh 'mvn clean package'
            }
        }

        stage('Build Docker Images'){
            steps{
                sh 'docker version'
                sh 'docker build -t web-app-1.1 .'
                sh 'docker image list'
                sh 'docker tag web-app-1.1 mani1765/web-app-1.1:web-app-1.1'
            }
        }
    }
}
