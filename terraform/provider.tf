provider "aws" {
    region = "eu-west-3"
    access_key = var.access_key
    secret_key = var.secret_key
}


variable access_key {}

variable secret_key {}