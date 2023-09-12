resource "aws_key_pair" "key-pair" {
  key_name   = "test-key"
  public_key = var.public_key # Replace with your public SSH key
}

variable public_key {}
