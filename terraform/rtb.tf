#  route table responsible for routing traffic to the subnets
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.test-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name: "public-rtb"
    }
}

# #  route table responsible for routing traffic to the subnets
# resource "aws_route_table" "private_route_table-1" {
#     vpc_id = aws_vpc.test-vpc.id

#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_nat_gateway.gw1.id
#     }

#     tags = {
#         Name: "private-rtb-1"
#     }
# }

# #  route table responsible for routing traffic to the subnets
# resource "aws_route_table" "private_route_table-2" {
#     vpc_id = aws_vpc.test-vpc.id

#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_nat_gateway.gw2.id
#     }

#     tags = {
#         Name: "private-rtb-2"
#     }
# }
