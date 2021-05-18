pipeline {
    agent {
        label 'NODEJS'
    }

    stages {
        stage('Download Dependencies') {
            steps {
                sh '''
                go build
                '''
            }
        }



        stage('preapare Artifact') {
            steps {
                sh '''
                 zip -r ../login.zip *
                 '''
            }
        }

        stage('Upload Artifacts') {
            steps {
                sh '''
                  curl -f -v -u admin:admin123 --upload-file /home/ubuntu/workspace/CI-Pipelines/login.zip http://172.31.11.166:8081/repository/login/login.zip
                  '''
           }

        }
    }
}