# Custom vpc for training on
resource "aws_vpc" "test-vpc" {

    #IP range for subnets in vpc 
    cidr_block = "10.0.0.0/16"

    #Required by EKS 
    enable_dns_hostnames = true

    #Required by EKS 
    enable_dns_support = true

    tags = {
        Name = "test-vpc"
    }
}


output "vpc_id" {

    value = aws_vpc.test-vpc.id

    description = "vpc id"


}