resource "aws_security_group" "sgrp-aws_jumphost" {
  name        = "sgrp-aws_jumphost"
  description = "Security group for jumphost subnet"
  vpc_id      = aws_vpc.vpc-aws.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "sgrp-aws_jumphost"
    Owner = "John Ajera"
  }
}

resource "aws_security_group" "sgrp-aws_private" {
  name        = "sgrp-aws_private"
  description = "Security group for private subnet"
  vpc_id      = aws_vpc.vpc-aws.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.0.1.0/24"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.0.1.0/24", "172.0.2.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "sgrp-aws_private"
    Owner = "John Ajera"
  }
}

resource "aws_security_group" "sgrp-aws_public" {
  name        = "sgrp-aws_public"
  description = "Security group for public subnet"
  vpc_id      = aws_vpc.vpc-aws.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.0.1.0/24"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.0.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "sgrp-aws_public"
    Owner = "John Ajera"
  }
}
