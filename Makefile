#!make
include ./service/.env

## tests the service
test-service:
	go test ./service/...


## build the service
build-service: test-service
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./service/manifestservice ./service/cmd/main


## dockerize service
dockerize-service: build-service
	docker build -f ./service/Dockerfile -t manifestservice:latest .