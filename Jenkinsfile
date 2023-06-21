pipeline {
    agent any
    stages {
        stage ('SCM Checkout'){
            steps {
                git 'https://github.com/jeeva1806/Docker-jenkins'
            }
        }
        stage ('Docker Image Build'){
            steps {
                sh 'docker build -t myhttpd .'
            }
        }
        stage ('Docker Network Create'){
            steps {
                sh 'docker volume create myhttpd_vol'
            }
        }
        stage ('Remove previous container'){
            steps {
                sh 'docker rm -f myhttpd'
            }
        }
        stage ('Docker Deployment'){
            steps {
                sh 'docker run -itd --mount source=myhttpd_vol,destination=/var/www/html --name myhttpd -p "8090:80" myhttpd'
            }
        }
        
    }
}
