output "repo_arn" {
  value       = aws_ecr_repository.repo.arn
  sensitive   = false
  description = "Full ARN of the repository"
}

output "repo_url" {
  value       = aws_ecr_repository.repo.repository_url
  sensitive   = false
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
}
