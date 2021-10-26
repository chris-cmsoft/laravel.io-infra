# Laravel In Kubernetes Infrastructure

Demo of the [Laravel In Kubernetes Series](https://chris-vermeulen.com/laravel-in-kubernetes/), deploying the Laravel.io project.

This repo contains the infrastructure for deploying the application on DigitalOcean in Kubernetes.

## Credential Setup

Once you've cloned the repo, you should first create a `local.auto.tfvars` file, 
which contains the secrets for your DigitalOcean account

```hcl-terraform
do_token="your_do_token"
do_region="fra1"
```

## Install Providers 

The next step is to install the necessary providers

```bash
terraform init
terraform validate
```

## Create the Infrastructure

```bash
terraform apply
```