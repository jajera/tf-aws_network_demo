resource "aws_vpc" "on_prem" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name  = "on_prem"
    Owner = "John Ajera"
  }
}

resource "aws_vpc" "aws" {
  cidr_block = "172.0.0.0/16"

  tags = {
    Name  = "aws"
    Owner = "John Ajera"
  }
}

resource "aws_vpc_peering_connection" "on_prem_to_aws" {
  peer_vpc_id = aws_vpc.on_prem.id
  vpc_id      = aws_vpc.aws.id

  tags = {
    Name  = "on_prem_to_aws"
    Owner = "John Ajera"
  }
}

resource "aws_internet_gateway" "aws_ig" {
  vpc_id = aws_vpc.aws.id

  tags = {
    Name  = "aws_ig"
    Owner = "John Ajera"
  }
}

resource "aws_route_table" "aws_public_route_table" {
  vpc_id = aws_vpc.aws.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_ig.id
  }

  tags = {
    Name  = "aws_public_route_table"
    Owner = "John Ajera"
  }
}

resource "aws_route" "aws_public_route_to_internet" {
  route_table_id         = aws_route_table.aws_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.aws_ig.id
}

resource "aws_route_table" "aws_private_route_table" {
  vpc_id = aws_vpc.aws.id

  route {
    cidr_block                = "0.0.0.0/0"
    vpc_peering_connection_id = aws_vpc_peering_connection.on_prem_to_aws.id
  }

  tags = {
    Name  = "aws_private_route_table"
    Owner = "John Ajera"
  }
}

resource "aws_subnet" "aws_private_subnet" {
  vpc_id     = aws_vpc.aws.id
  cidr_block = "172.0.1.0/24"

  tags = {
    Name  = "aws_private_subnet"
    Owner = "John Ajera"
  }
}

resource "aws_subnet" "aws_public_subnet" {
  vpc_id     = aws_vpc.aws.id
  cidr_block = "172.0.2.0/24"

  tags = {
    Name  = "aws_public_subnet"
    Owner = "John Ajera"
  }
}

resource "aws_route_table_association" "aws_private_route_table_association" {
  subnet_id      = aws_subnet.aws_private_subnet.id
  route_table_id = aws_route_table.aws_private_route_table.id
}

resource "aws_route_table_association" "aws_public_route_table_association" {
  subnet_id      = aws_subnet.aws_public_subnet.id
  route_table_id = aws_route_table.aws_public_route_table.id
}

