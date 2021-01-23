#!make
include ./frontend/.env
include ./service/.env

export $(shell sed 's/=.*//' ./frontend/.env)
export $(shell sed 's/=.*//' ./service/.env)


## dockerize frontend
docker-frontend: 
	docker build -f ./frontend/Dockerfile -t $$FRONTEND_BUILD_NAME:$$FRONTEND_VERSION .	

## run frontend
run-frontend: docker-frontend
    #stop running image
	docker stop $(docker ps -a | grep $$FRONTEND_BUILD_NAME | awk '{print $1}') || true && echo "stopped running service" || echo "nothing to stop"
	docker run -d -p $$FRONTEND_PORT:80 $$FRONTEND_BUILD_NAME:$$FRONTEND_VERSION

## dockerize frontend
docker-frontend-push: docker-frontend
	docker build -f ./service/Dockerfile -t $$FRONTEND_BUILD_NAME:$$FRONTEND_VERSION .	

## tests  service
test-service:    
	go test ./service/...

## build  service
build-service: test-service
	go mod tidy && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./service/manifestservice ./service/cmd/main

## build service api
build-service-api: build-service
	which swagger || (GO111MODULE=off go get -u github.com/go-swagger/go-swagger/cmd/swagger)
	go mod vendor && swagger generate spec -o ./service/api/swagger.yaml --scan-models

## run the service
run-service: build-service
	go run ./cmd/main/

## serve service api
serve-service-api: build-service
	swagger serve -F=swagger ./api/swagger.yaml

## dockerize service
docker-service: build-service
	docker build -f ./service/Dockerfile -t $$API_BUILD_NAME:$$API_VERSION .	

## dockerize service
docker-service-push: docker-service
	docker build -f ./service/Dockerfile -t $$API_BUILD_NAME:$$API_VERSION .	

## tests admin service
test-admin:
	mvn test ./service-admin/...

## build admin service
build-admin: test-admin
	mvn clean build

## run admin service
run-admin: build-admin
	

## dockerize admin
docker-admin: build-admin
	

## dockerize admin
docker-admin-push: docker-admin
	