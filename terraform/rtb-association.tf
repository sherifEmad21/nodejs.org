# route table association responsible for association between route table and subnet as the two resources are not connceted
resource "aws_route_table_association" "public-rtb-association-1" {
    subnet_id = aws_subnet.public-subnet-1.id 
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public-rtb-association-2" {
    subnet_id = aws_subnet.public-subnet-2.id 
    route_table_id = aws_route_table.public_route_table.id
}

# resource "aws_route_table_association" "private-rtb-association-1" {
#     subnet_id = aws_subnet.private-subnet-1.id 
#     route_table_id = aws_route_table.private_route_table-1.id
# }

# resource "aws_route_table_association" "private-rtb-association-2" {
#     subnet_id = aws_subnet.private-subnet-2.id 
#     route_table_id = aws_route_table.private_route_table-2.id
# }
