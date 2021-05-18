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

        stage('go get  Dependencies') {
            steps {
                sh '''
                go build
                go get github.com/dgrijalva/jwt-go 
                go get github.com/labstack/echo 
                go get github.com/labstack/echo/middleware 
                go get github.com/labstack/gommon/log 
                go get github.com/openzipkin/zipkin-go 
                go get github.com/openzipkin/zipkin-go/middleware/http
                go get github.com/openzipkin/zipkin-go/reporter/http
                
                go build main.go users.go tracing.go 
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