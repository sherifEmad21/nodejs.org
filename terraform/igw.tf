# internet gateway to route requests to global network
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.test-vpc.id

    tags = {
        Name: "test-igw"
    }

}
