pipeline {
    agent any

    stages {
        stage('Docker Build') {
            steps {
                sh 'docker built -t shivrajdocker02/angular-cal .'
            }
        }
        stage('Push Docker') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerpwd', passwordVariable: 'DockerpwdPassword', usernameVariable: 'DockerpwdUser')]) {
                sh "docker login -u ${env.DockerpwdUser} -p ${env.DockerpwdPassword}"
                sh 'docker push shivrajdocker02/angular-cal'
            }
        }
        stage('Run and Validate ') {
            steps {
                sh 'docker container run -dt -p 8080:80 shivrajdocker02/angular-cal'
                sh 'docker image ls'
                sh 'docker container ls'
            }
        }
    }
}
