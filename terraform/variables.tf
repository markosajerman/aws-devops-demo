# AWS region for provisioning
variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "eu-central-1"
}

# Environment name - for resource naming and tagging
variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# Project name - prefix for all resource names
variable "project_name" {
  description = "Project name used as prefix for resource naming"
  type        = string
  default     = "aws-devops-demo"
}

# S3 bucket name for storing artifacts
variable "s3_bucket_name" {
  description = "Project name used as prefix for storing deployment artifacts"
  type        = string
  default     = "aws-devops-demo-artifacts"
}

# ECR repository name for storing Docker images
variable "ecr_repository_name" {
  description = "Name of the ECR repository for Docker images"
  type        = string
  default     = "aws-devops-demo-app"
}