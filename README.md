# DevOps Blogging Application

This project demonstrates a complete DevOps deployment pipeline including:

- Docker containerization
- AWS infrastructure
- Terraform infrastructure as code
- GitHub Actions CI/CD pipeline
- Auto Scaling deployment
- Application Load Balancer




# DevOps Blogging Application Deployment

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![CI/CD](https://img.shields.io/badge/CI/CD-GitHubActions-black)
![Monitoring](https://img.shields.io/badge/Monitoring-CloudWatch-green)

---

## Project Overview

This project demonstrates a complete DevOps workflow for deploying a containerized Spring Boot application on AWS using Infrastructure as Code and CI/CD automation.

The project includes:

- Infrastructure provisioning with Terraform
- Containerization with Docker
- CI/CD pipeline using GitHub Actions
- Deployment using EC2 Auto Scaling Groups
- Monitoring and logging using CloudWatch

---

## Tech Stack

- **Cloud Provider:** AWS
- **Infrastructure as Code:** Terraform
- **Containerization:** Docker
- **CI/CD:** GitHub Actions
- **Container Registry:** Amazon ECR
- **Compute:** EC2 Auto Scaling Group
- **Load Balancing:** Application Load Balancer
- **Monitoring:** Amazon CloudWatch
- **Logging:** CloudWatch Logs
- **Application:** Spring Boot

---

## Key DevOps Features

- Infrastructure fully provisioned using **Terraform**
- Automated **CI/CD pipeline** with GitHub Actions
- Docker image build and push to **Amazon ECR**
- Automatic deployment to **EC2 instances**
- **Auto Scaling Group** for high availability
- **Application Load Balancer** for traffic distribution
- Centralized logging using **CloudWatch Logs**
- **CloudWatch CPU alarms** for monitoring and alerting

---

## Architecture

![Architecture](docs/diagramAWS.jpeg)

### Architecture Explanation

User traffic is first routed through an **Application Load Balancer (ALB)** which distributes incoming requests across multiple EC2 instances.
These instances are managed by an **Auto Scaling Group (ASG)** that automatically adjusts the number of running instances depending on the system load and health status.

Each EC2 instance runs a **Docker container** hosting the **Spring Boot application**, ensuring consistent and portable deployments.

The **CI/CD pipeline** is implemented using **GitHub Actions**.
Whenever code is pushed to the GitHub repository, the pipeline automatically builds a Docker image and pushes it to **Amazon Elastic Container Registry (ECR)**.

During deployment, EC2 instances pull the latest container image from **Amazon ECR** and start the updated application container.

For monitoring and observability, **CloudWatch Logs** collect application logs from the running containers, while **CloudWatch CPU alarms** monitor instance utilization and trigger alerts when predefined thresholds are exceeded.        


---

## CI/CD Pipeline

The CI/CD pipeline automatically builds and deploys the application when code is pushed to the repository.

Steps:

1. Build Docker image
2. Tag image with commit SHA
3. Push image to Amazon ECR
4. Deploy new version
5. Refresh Auto Scaling Group instances

![Pipeline](docs/pipelineDiagram.jpeg)

---

## Infrastructure as Code

Infrastructure is fully managed using Terraform.

Resources created:

- VPC
- Subnets
- Security Groups
- Application Load Balancer
- Launch Template
- Auto Scaling Group
- CloudWatch Alarms
- CloudWatch Log Groups

---

## Container Registry

Docker images are stored in Amazon ECR.

![ECR](docs/ecr-images.png)

---

## Monitoring and Logging

Monitoring is implemented using Amazon CloudWatch.

Features:

- CPU utilization alarm
- Centralized container logs
- Real-time log monitoring

![CloudWatch Logs](docs/cloudwatch-logs.png)

---

## Alarm Example

CloudWatch alarm configured for high CPU usage.

![Alarm](docs/cloudwatch-alarm.png)

---

![Blogging-app Dashboard](docs/dashboard.png)


## How to Reproduce

Clone the repository:
https://github.com/prince456321/devops-blogging-app.git

```bash
git clone https://github.com/YOUR_USERNAME/devops-blogging-app.git
cd devops-blogging-app
terraform init
terraform apply

Push changes to trigger the CI/CD Pipeline

git add .
git commit -m "update"
git push origin main


