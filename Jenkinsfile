pipeline{
    agent any

    stages{
        stage('Test'){
            steps{
                sh '''
                    echo "Hello world"
                '''
            }
        }
        stage('Build'){
            steps{
                sh '''
                    echo "building docker image"
                '''
            }
        }
        stage('deploy'){
            steps{
                sh '''
                    echo "deploying docker image"
                '''
            }
        }
        stage('push'){
            steps{
                sh '''
                    echo "pushing docker image"
                '''
            }
        }    
        stage('cleanup'){
            steps{
                sh '''
                    echo "cleaning up docker image"
                '''
            }
        }
    }
}


