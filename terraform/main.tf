# S3 bucket for storing deployment artifacts 
resource "aws_s3_bucket" "artifacts" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.environment
    Project     = var.project_name
  }
}

# Block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning on S3 bucket - rollback purposes
resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}

# # NOTE: ECR is not available in LocalStack free tier
# # ECR repository for storing Docker images
# resource "aws_ecr_repository" "app" {
#   name = var.ecr_repository_name
#   # Allows overwriting existing image tags - dev
#   image_tag_mutability = "MUTABLE"

#   # Enable image scanning on push - detect vulnerabilities
#   image_scanning_configuration {
#     scan_on_push = true
#   }

#   tags = {
#     Name        = var.ecr_repository_name
#     Environment = var.environment
#     Project     = var.project_name
#   }
# }


