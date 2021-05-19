pipeline {
    agent {
        label 'JAVA' 
    }

    stages {
        stage('Go Get Git hubs files') {
            steps {
                sh '''
                go get "github.com/dgrijalva/jwt-go" 
                go get "github.com/labstack/echo" 
                go get "github.com/labstack/echo/middleware" 
                go get "github.com/labstack/gommon/log" 
                go get "github.com/openzipkin/zipkin-go" 
                go get "github.com/openzipkin/zipkin-go/middleware/http"
                go get "github.com/openzipkin/zipkin-go/reporter/http"
                '''
            }
        }
        stage('Again build') {
            steps {
                sh '''
                 go build main.go user.go tracing.go 
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
                  curl -f -v -u admin:admin123 --upload-file /home/ubuntu/workspace/CI-Pipelines/login-ci/login.zip http://172.31.11.166:8081/repository/login/login.zip
                  '''
           }

        }
    }
}