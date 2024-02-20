pipeline{
           agent any
           environment {
                      DOCKERHUB_CREDENTIALS=credentials('dockerhub ')
           }
           stages {
                      stage('Build') {
                                    steps {
                                                sh 'docker build -t marinaaaaa/angular-image:latest .'
                                          }
                      }
                      stage('Login') {
                                    steps {
                                                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                                          }
                      }
                      stage('Push') {
                                    steps {
                                                sh 'docker push marinaaaaa/angular-image:latest'
                                          }
                      }
                      stage('deploy') {
                                    steps {
                                                sh 'docker run -d -p 5200:5200 --name app marinaaaaa/angular-image:latest'
                                          }
                      }
           }
           post {
                      always {
                                                bat 'docker logout'
                             }
                }
}
