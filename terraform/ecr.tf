resource "aws_ecr_repository" "test_repo" {
  name			= "test-repo"
  image_tag_mutability  = "MUTABLE"

  tags = {
    Name = "test-repo"
  }
}
