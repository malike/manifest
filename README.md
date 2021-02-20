
# Over-engineering : Manifest

This project over-engineers a simple application deployment, using GitOps.
Over engineering is not a good thing but it's for purposes of learning.

There are 3 services, an Java based admin service, Golang based API service and a frontend in vanilla JS and HTMl5.

It's designed to be _"cloud-agnostic"_ and also work with either Github Actions or Gitlab CI as CI. For cloud infra it works with GKE and EKS for now.

## 1. CI 


_Option 1 : GithubActions_


_Option 2 : Gitlab Runners_


## 2. CD

_Option 1 : Deployment on K8S : AWS_


_Option 2 : Deployment on K8S : GKE_


_Option 3. Deployment with Docker Compose on Single Host_


## 3. Monitoring & Observability

_Using Prometheus and Grafana for Metrics_


_Zipkin for Distributed Tracing_


## 4. Usage



