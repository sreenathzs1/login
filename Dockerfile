# FROM alpine:latest

# RUN apk add --no-cache git make musl-dev go

# # Configure Go
# ENV GOROOT /usr/lib/go
# ENV GOPATH /go
# ENV PATH /go/bin:$PATH

# RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# # Install Glide
# RUN         go build main .
# RUN         go get github.com/dgrijalva/jwt-go
# RUN         go get github.com/labstack/echo
# RUN         go get github.com/labstack/echo/middleware
# RUN         go get github.com/labstack/gommon/log
# RUN         go get github.com/openzipkin/zipkin-go
# RUN         go get github.com/openzipkin/zipkin-go/middleware/http
# RUN         go get github.com/openzipkin/zipkin-go/reporter/http
# RUN         go build
# WORKDIR $GOPATH

# CMD ["./login"]



FROM golang:1.16-alpine

WORKDIR /app

COPY main.go ./
COPY tracing.go ./
COPY user.go ./
RUN go mod download

COPY *.go ./

RUN go build -o main .

EXPOSE 8080

CMD [ "./main" ]


# FROM        golang
# RUN         mkdir -p /go
# WORKDIR     /go/login
# COPY        / .
# RUN        go mod init example.com/login
# RUN        go get
# RUN        go build
# EXPOSE      8080