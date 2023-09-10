resource "aws_ecr_repository" "test_repo" {
  name			= "test-repo"
  image_tag_mutability  = var.image_tag_mutability

  tags = {
    Name = "test-repo"
  }
}
