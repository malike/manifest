#!make
include ./service/.env

## tests the service
test-service:
	go test ./service/...

## build the service
build-service: test-service
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./service/manifestservice ./service/cmd/main

## build service api
build-service-api: build-service
	which swagger || (GO111MODULE=off go get -u github.com/go-swagger/go-swagger/cmd/swagger)
	go mod vendor && swagger generate spec -o ./service/swagger.yaml --scan-models

## run the service
run-service: build-service
	go run ./cmd/main/

## serve service api
serve-service-api: build-service
	swagger serve -F=swagger swagger.yaml

## dockerize service
docker-service: build-service
	docker build -f ./service/Dockerfile -t manifestservice:latest .	

## dockerize service
docker-service-push: docker-service
	docker build -f ./service/Dockerfile -t manifestservice:latest .	