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
                sh 'docker build -t jeeva1806/myhttpd:0.1 .'
            }
        }
        stage ('Docker Image Push'){
            steps {
                sh 'docker login -u jeeva1806 -p "${docker_password}"'
                sh 'docker push jeeva1806/myhttpd:0.1'
            }
        }
        stage ('Docker Volume Create'){
            steps {
                sh 'docker volume create myhttpd_vol'
            }
        }
        stage ('Remove Previous Network'){
            steps {
                sh 'docker network rm myhttpd_network'
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
                sh 'docker run -itd --mount source=myhttpd_vol,destination=/var/www/html --network=myhttpd_network --name myhttpd -p "8090:80" jeeva1806/myhttpd:0.1'
            }
        }      
    }
}
