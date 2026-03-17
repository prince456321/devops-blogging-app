# Ì∫Ä DevOps Blogging Application (End-to-End AWS Deployment)

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![CI/CD](https://img.shields.io/badge/CI/CD-GitHubActions-black)
![Monitoring](https://img.shields.io/badge/Monitoring-CloudWatch-green)

---

## Ì≥å Project Overview

This project demonstrates a **complete end-to-end DevOps workflow** for deploying a containerized Spring Boot application on AWS using Infrastructure as Code and CI/CD automation.

It covers the full lifecycle:

> Code ‚Üí Build ‚Üí Test ‚Üí Scan ‚Üí Containerize ‚Üí Push ‚Üí Deploy ‚Üí Monitor

---

## ÌæØ Key Objectives

- Automate infrastructure provisioning using Terraform  
- Build and deploy a containerized application  
- Implement a complete CI/CD pipeline  
- Ensure scalability and high availability  
- Apply basic DevSecOps practices (Sonar + Trivy)  
- Monitor application and infrastructure  

---

## Ì∑± Architecture

![Architecture](docs/diagramAWS.jpeg)

### Ì¥ç Architecture Explanation

- User requests are routed through an **Application Load Balancer (ALB)**  
- Traffic is distributed across EC2 instances in an **Auto Scaling Group (ASG)**  
- Each instance runs a **Docker container** with a Spring Boot application  
- Docker images are stored in **Amazon ECR**  
- **GitHub Actions** automates build, scan, and deployment  
- **CloudWatch Logs** collects logs  
- **CloudWatch Alarms** monitor CPU usage  

---

## ‚öôÔ∏è Tech Stack

- AWS (EC2, ALB, ASG, ECR, CloudWatch)
- Terraform
- Docker
- GitHub Actions
- SonarCloud
- Trivy
- Spring Boot

---

## Ì¥Ñ CI/CD Pipeline

![Pipeline](docs/pipelineDiagram.jpeg)

Pipeline stages:

1. Run tests  
2. Build Docker image  
3. Scan image (Trivy)  
4. Push to Amazon ECR  
5. Deploy to EC2 via Auto Scaling refresh  

---

## ÌøóÔ∏è Infrastructure as Code

Terraform provisions:

- VPC  
- Subnets  
- Security Groups  
- ALB  
- Launch Template  
- Auto Scaling Group  
- CloudWatch Alarms  
- CloudWatch Logs  

---

## Ì≥¶ Container Registry

Docker images stored in Amazon ECR:

![ECR](docs/ecr-images.png)

---

## Ì≥ä Monitoring & Logging

- Centralized logs via CloudWatch  
- CPU usage alarms  
- Real-time observability  

![CloudWatch Logs](docs/cloudwatch-logs.png)

---

## Ì¥ß Troubleshooting & Lessons Learned

During this project, I encountered real-world DevOps issues across infrastructure, CI/CD, networking, and containerization.

### Ì¥π Terraform Backend
- Problem: backend not working  
- Cause: `terraform init` missing  
- Fix: initialize backend  

---

### Ì¥π EC2 Access (SSM)
- Problem: cannot connect  
- Cause: missing IAM role  
- Fix: attach `AmazonSSMManagedInstanceCore`  

---

### Ì¥π Security Group Issue
- Problem: app not reachable  
- Cause: ports closed  
- Fix: open HTTP/HTTPS  

---

### Ì¥π ALB Health Check
- Problem: instances unhealthy  
- Cause: wrong endpoint  
- Fix: correct health path  

---

### Ì¥π YAML Pipeline Error
- Problem: pipeline failed  
- Cause: indentation error  
- Fix: correct YAML  

---

### Ì¥π Docker Image Issues
- Problem: image not found  
- Cause: not shared between jobs  
- Fix:
  - docker save  
  - upload artifact  
  - docker load  

---

### Ì¥π Trivy Scan Issue
- Problem: scan failed  
- Cause: wrong image reference  
- Fix: correct tagging  

---

### Ì¥π Pipeline Design
- Problem: messy pipeline  
- Fix: split into:
  - test ‚Üí build ‚Üí scan ‚Üí deploy  

---

Ì±â Ì≤° **Key Learning:**  
Most DevOps issues come from:
- networking  
- configuration  
- pipeline logic  
- environment variables  

---

## Ì∫Ä How to Reproduce

### 1. Clone repository

```bash
git clone https://github.com/YOUR_USERNAME/devops-blogging-app.git
cd devops-blogging-app
```

### 2. Configure AWS & Terraform Backend

Create the following resources in AWS:

### ‚ö†Ô∏è Terraform Backend Prerequisites

Before running Terraform, you must create the remote backend resources manually.

Terraform uses:
- S3 bucket ‚Üí to store the state file
- DynamoDB table ‚Üí to manage state locking

---

### Ì¥π Create S3 Bucket

Create an S3 bucket for Terraform state:

Example:
- Bucket name: `terraform-state-bucket`

---

### Ì¥π Create DynamoDB Table

Create a DynamoDB table with the following configuration:

- Table name: `terraform-state-lock`
- Partition key: `LockID` (String)
- Billing mode: On-demand (default)

---

Ì±â These resources are required before running:

```bash

### 3. Initialize Terraform

terraform init
terraform apply

```

### 4. Configure GitHub Secrets

Go to:

`Settings ‚Üí Secrets and variables ‚Üí Actions`

Add the following secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_ACCOUNT_ID`
- `SONAR_TOKEN`

### 5. Push code to trigger pipeline

```bash
git add .
git commit -m "deploy"
git push origin main
```

---

## Ì≥ò Documentation

Full setup guide available:

![Download PDF](docs/devops_project_reproduction_guide.pdf)

---

## Ì¥Æ Future Improvements

- Add Ansible for configuration management  
- Improve pipeline security (fail on vulnerabilities)  
- Add automated rollback strategy  
- Implement blue/green deployment
