output "ecr_url" {
    value = try(aws_ecr_repository.test_repo.repository_url,"")
}
