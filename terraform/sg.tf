# # Security group custom made firewall
# resource "aws_security_group" "test-sg" {
#     name = "test-sg"
#     vpc_id = aws_vpc.test-vpc.id
    
#     # ingress --> inbound filter
#     ingress {
#         description = "SSH"
#         from_port   = 22
#         to_port     = 22
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     ingress {
#         description = "SSH"
#         from_port   = 80
#         to_port     = 80
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     ingress {
#         description = "HTTP"
#         from_port   = 3000
#         to_port     = 3000
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     # egress --> outbound filter
#     egress {
#         from_port   = 0
#         to_port     = 0
#         protocol    = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#         prefix_list_ids = []
#     }

#     tags = {
#         Name = "test-sg"
#     }
# }


# Security group custom made firewall
resource "aws_security_group" "test-sg" {
    name = "test-sg"
    vpc_id = aws_vpc.test-vpc.id
    
    # ingress --> inbound filter
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow incoming traffic from the EKS control plane"
        from_port   = 1025
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow incoming traffic for Kubernetes pods within the VPC"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow incoming traffic from Amazon ECR"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        # Replace with the CIDR range(s) used by your ECR repository or ECR registry.
        # Example: cidr_blocks = ["203.0.113.0/24"]
        cidr_blocks = ["0.0.0.0/0"]
    }


    # egress --> outbound filter
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        prefix_list_ids = []
    }

    tags = {
        Name = "test-sg"
    }
}