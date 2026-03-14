variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "blogging-app"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet in AZ 1"
  type        = string
  default     = "10.10.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet in AZ 2"
  type        = string
  default     = "10.10.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet in AZ 1"
  type        = string
  default     = "10.10.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet in AZ 2"
  type        = string
  default     = "10.10.4.0/24"
}

variable "availability_zone_1" {
  description = "First availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Second availability zone"
  type        = string
  default     = "us-east-1b"
}

variable "instance_type" {
  description = "EC2 instance type for app servers"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Amazon Linux 2023 AMI ID"
  type        = string
  default     = "ami-02dfbd4ff395f2a1b"
}

variable "app_port" {
  description = "Application port exposed on EC2"
  type        = number
  default     = 8082
}

variable "container_port" {
  description = "Application port inside the container"
  type        = number
  default     = 8080
}

variable "asg_desired_capacity" {
  description = "Desired number of EC2 instances in ASG"
  type        = number
  default     = 2
}

variable "asg_min_size" {
  description = "Minimum number of EC2 instances in ASG"
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum number of EC2 instances in ASG"
  type        = number
  default     = 3
}

variable "ecr_repository_name" {
  description = "Amazon ECR repository name"
  type        = string
  default     = "twitter-repo"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}
