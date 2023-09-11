# subnet is the container that holds the ec2 instance isnide it
resource "aws_subnet" "public-subnet-1" {

    vpc_id            = aws_vpc.test-vpc.id

    cidr_block        = "10.0.0.0/26" 

    availability_zone = "eu-west-3a"

    #Required by EKS
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet-1"
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/eks"    = "shared"  
    }
}

# subnet is the container that holds the ec2 instance isnide it
resource "aws_subnet" "public-subnet-2" {

    vpc_id            = aws_vpc.test-vpc.id

    cidr_block        = "10.0.0.64/26" 

    availability_zone = "eu-west-3b"

    #Required by EKS
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet-2"
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/eks"    = "shared"  
    }
}

# subnet is the container that holds the ec2 instance isnide it
resource "aws_subnet" "private-subnet-1" {

    vpc_id            = aws_vpc.test-vpc.id

    cidr_block        = "10.0.0.128/27" 

    availability_zone = "eu-west-3a"

    #Required by EKS
    map_public_ip_on_launch = true

    tags = {
        Name = "private-subnet-1"
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/eks"    = "shared"  
    }
}

# subnet is the container that holds the ec2 instance isnide it
resource "aws_subnet" "private-subnet-2" {

    vpc_id            = aws_vpc.test-vpc.id

    cidr_block        = "10.0.0.160/28" 

    availability_zone = "eu-west-3b"

    #Required by EKS
    map_public_ip_on_launch = true

    tags = {
        Name = "private-subnet-2"
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/eks"    = "shared"  
    }
}
