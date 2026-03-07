# Output S3 bucket name - CI/CD pipeline references
output "s3_bucket_name" {
  description = "Name of the S3 artifacts bucket"
  value       = aws_s3_bucket.artifacts.bucket
}

# Output S3 bucket ARN - used for IAM policy definitions
output "s3_bucket_arn" {
  description = "ARN of the S3 artifacts bucket"
  value       = aws_s3_bucket.artifacts.arn
}

# Output ECR repository URL - used by Docker to push/pull images
output "ecr_repository_url" {
  description = "URL of the ECR repository for Docker image push/pull"
  value       = aws_ecr_repository.app.repository_url
}