pipeline {
    agent { 
           label 'dockerbuild' 
          }

    stages {
        stage('Docker Build') {
            steps {
                sh 'docker build -t shivrajdocker02/angular-cal .'
            }
        }
        stage('Push Docker') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerpwd', passwordVariable: 'DockerpwdPassword', usernameVariable: 'DockerpwdUser')]) {
                sh 'docker login -u ${env.DockerpwdUser} -p ${env.DockerpwdPassword}'
                sh 'docker push shivrajdocker02/angular-cal'
                  }
            }
        }
        stage('Run container and Validate ') {
            steps {
                sh 'docker container run -dt -p 9090:80 shivrajdocker02/angular-cal'
                sh 'docker image ls'
                sh 'docker container ls'
            }
        }
    }
}
