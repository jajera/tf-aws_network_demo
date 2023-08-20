resource "aws_vpc" "vpc-on_prem" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name  = "vpc-on_prem"
    Owner = "John Ajera"
  }
}

resource "aws_vpc" "vpc-aws" {
  cidr_block = "172.0.0.0/16"

  tags = {
    Name  = "vpc-aws"
    Owner = "John Ajera"
  }
}

# resource "aws_vpc_peering_connection" "on_prem_to_aws" {
#   peer_vpc_id = aws_vpc.on_prem.id
#   vpc_id      = aws_vpc.aws.id

#   tags = {
#     Name  = "on_prem_to_aws"
#     Owner = "John Ajera"
#   }
# }

resource "aws_internet_gateway" "ig-aws_ig1" {
  vpc_id = aws_vpc.vpc-aws.id

  tags = {
    Name  = "ig-aws_ig1"
    Owner = "John Ajera"
  }
}

resource "aws_route_table" "internet_all" {
  vpc_id = aws_vpc.vpc-aws.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-aws_ig1.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.ig-aws_ig1.id
  }

  tags = {
    Name  = "rt-aws_internet_all"
    Owner = "John Ajera"
  }
}

# resource "aws_route" "aws_public_route_to_internet" {
#   route_table_id         = aws_route_table.aws_public_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.aws_ig.id
# }

# resource "aws_route_table" "aws_private_route_table" {
#   vpc_id = aws_vpc.aws.id

#   route {
#     cidr_block                = "0.0.0.0/0"
#     vpc_peering_connection_id = aws_vpc_peering_connection.on_prem_to_aws.id
#   }

#   tags = {
#     Name  = "aws_private_route_table"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_route_table" "aws_private_route_table" {
#   vpc_id = aws_vpc.aws.id

#   route {
#     cidr_block                = "0.0.0.0/0"

#   }

#   tags = {
#     Name  = "aws_private_route_table"
#     Owner = "John Ajera"
#   }
# }

resource "aws_route_table_association" "rta-aws_pvt" {
  route_table_id = aws_route_table.internet_all.id
  subnet_id      = aws_subnet.sn-aws_pvt_subnet.id
}

resource "aws_route_table_association" "rta-aws_allow_internet" {
  subnet_id      = aws_subnet.sn-aws_admin_subnet.id
  route_table_id = aws_route_table.internet_all.id
}

# resource "aws_route_table_association" "aws_public_route_table_association" {
#   subnet_id      = aws_subnet.aws_public_subnet.id
#   route_table_id = aws_route_table.aws_public_route_table.id
# }

resource "aws_subnet" "sn-aws_admin_subnet" {
  vpc_id            = aws_vpc.vpc-aws.id
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = "172.0.1.0/24"

  tags = {
    Name  = "sn-aws_admin_subnet"
    Owner = "John Ajera"
  }
}

resource "aws_subnet" "sn-aws_pvt_subnet" {
  vpc_id            = aws_vpc.vpc-aws.id
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = "172.0.2.0/24"

  tags = {
    Name  = "sn-aws_pvt_subnet"
    Owner = "John Ajera"
  }
}

resource "aws_subnet" "sn-aws_pub_subnet" {
  vpc_id            = aws_vpc.vpc-aws.id
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = "172.0.3.0/24"

  tags = {
    Name  = "sn-aws_pub_subnet"
    Owner = "John Ajera"
  }
}

resource "aws_eip" "eip-aws_eip1" {
  domain = "vpc"

  tags = {
    Name  = "eip-aws_eip1"
    Owner = "John Ajera"
  }
}

resource "aws_nat_gateway" "ngw-aws_ngw1" {
  allocation_id = aws_eip.eip-aws_eip1.id
  subnet_id     = aws_subnet.sn-aws_pub_subnet.id

  depends_on = [aws_internet_gateway.ig-aws_ig1]

  tags = {
    Name  = "ngw-aws_ngw1"
    Owner = "John Ajera"
  }
}

# resource "aws_nat_gateway" "ngw-aws_pvt_internet1" {
#   allocation_id = aws_eip.eip-aws_eip1.id
#   subnet_id     = aws_subnet.sn-aws_pvt_subnet.id

#   depends_on = [aws_internet_gateway.ig-aws_ig1]

#   tags = {
#     Name  = "ig-aws_pvt_internet1"
#     Owner = "John Ajera"
#   }
# }
