output "ecr_url" {
    value = try(aws_ecr_repository.test_repo.repository_url,"")
}

output "cluster_name" {
    value = aws_eks_cluster.eks.name
}