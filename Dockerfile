# FROM alpine:latest

# RUN apk add --no-cache git make musl-dev go

# # Configure Go
# ENV GOROOT /usr/lib/go
# ENV GOPATH /go
# ENV PATH /go/bin:$PATH

# RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# # Install Glide
# RUN go build main .
# RUN go get -u github.com/Masterminds/glide/...

# WORKDIR $GOPATH

# CMD ["./main"]



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