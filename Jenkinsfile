pipeline {
    agent any
    stages {
        stage('Greeting') {
            steps {
                sh '''
                echo "Good Morning Nadia, let's get building!"
                '''
            }
        }            
        stage('Build') {
            steps {
                sh '''
                docker build -t scribral/nnai-python-api:latest .
                '''
           }
        }
        stage('PUSH') {
            steps {
                sh '''
                docker push scribral/nnai-python-api:latest
                '''
           }
        }
    
        stage('Deploy') {
            steps {
                sh '''
                kubectl apply -f ./kubernetes -n production
                kubectl rollout restart deployment flask-deployment -n production
                '''
            }
        }
        stage('Clean Up') { 
            steps {
                sh '''
                docker system prune -a --force
                '''
            }
        }                
    }
}