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
        stage ('Docker Volume Create'){
            steps {
                sh 'docker volume create myhttpd_vol'
            }
        }
        stage ('Dcoker Network Create'){
            steps {
                sh 'docker network create myhttpd_network'
            }
        }
        stage ('Remove Previous Container'){
            steps {
                sh 'docker rm -f myhttpd'
            }
        }
        stage ('Docker Deployment'){
            steps {
                sh 'docker run -itd --mount source=myhttpd_vol,destination=/var/www/html --network=myhttpd_network --name myhttpd -p "8090:80" myhttpd'
            }
        }      
    }
}
