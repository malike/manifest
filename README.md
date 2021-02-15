
# Over-engineering : Manifest

This project over-engineers a simple application deployment, using GitOps.
Over engineering is not a good thing but it's for purposes of learning.

There are 3 services, an Java based admin service, Golang based API service and a frontend in vanilla JS and HTMl5.

It's designed to be _"cloud-agnostic"_ and also work with either Github Actions or Gitlab CI as CI. For cloud infra it works with GKE and EKS for now.